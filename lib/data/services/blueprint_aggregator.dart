import 'package:get/get.dart';
import '../models/kit_model.dart';
import '../models/section_model.dart';
import '../providers/section_data_provider.dart';

/// Aggregated, narrative-friendly view of the user's startup data.
/// Built lazily from KitModel + SectionDataProvider + ProgressProvider on demand.
class Blueprint {
  final String companyName;
  final String? tagline;
  final String? vision;
  final String? mission;
  final String? coreValues;

  final HealthScore health;
  final List<NextAction> nextActions;
  final List<KitSummary> kits;
  final FinancialSummary finance;
  final InvestorPitch pitch;
  final List<Gap> gaps;

  Blueprint({
    required this.companyName,
    required this.tagline,
    required this.vision,
    required this.mission,
    required this.coreValues,
    required this.health,
    required this.nextActions,
    required this.kits,
    required this.finance,
    required this.pitch,
    required this.gaps,
  });
}

class HealthScore {
  final int overallPercent; // 0-100
  final int completionPercent;
  final int trackersWithDataPercent;
  final int financialSanity; // 0-100; revenue vs cost coherence
  final String label; // "Just Started" / "Building" / "Solid" / "Investor-Ready"
  HealthScore({
    required this.overallPercent,
    required this.completionPercent,
    required this.trackersWithDataPercent,
    required this.financialSanity,
    required this.label,
  });
}

class NextAction {
  final String title;
  final String reason;
  final String kitId;
  final SectionModel? section; // tap target
  final int priority; // 1 = highest
  NextAction({
    required this.title,
    required this.reason,
    required this.kitId,
    required this.section,
    required this.priority,
  });
}

class KitSummary {
  final KitModel kit;
  final int completedSections;
  final int totalSections;
  final List<SectionDigest> sections;
  KitSummary({
    required this.kit,
    required this.completedSections,
    required this.totalSections,
    required this.sections,
  });
}

class SectionDigest {
  final SectionModel section;
  final int recordCount;
  final int cellCount;
  final bool hasForm;
  final bool isComplete;
  final List<Map<String, dynamic>> records;
  final Map<String, dynamic> form;
  final Map<String, dynamic> cells;
  SectionDigest({
    required this.section,
    required this.recordCount,
    required this.cellCount,
    required this.hasForm,
    required this.isComplete,
    required this.records,
    required this.form,
    required this.cells,
  });
}

class FinancialSummary {
  final double y1Revenue;
  final double y1Opex;
  final double y1NetProfit;
  final int teamCount;
  final double totalCapex;
  final int leadsScored;
  final bool isProfitable;
  FinancialSummary({
    required this.y1Revenue,
    required this.y1Opex,
    required this.y1NetProfit,
    required this.teamCount,
    required this.totalCapex,
    required this.leadsScored,
    required this.isProfitable,
  });
}

class InvestorPitch {
  final String? problem;
  final String? solution;
  final String? whyUs;
  final String? proof;
  final String? ask;
  final String? market; // pulled from product industry analysis
  final int teamCount;
  final int customerCount;
  final double y1Revenue;
  final double y3Revenue;
  InvestorPitch({
    required this.problem,
    required this.solution,
    required this.whyUs,
    required this.proof,
    required this.ask,
    required this.market,
    required this.teamCount,
    required this.customerCount,
    required this.y1Revenue,
    required this.y3Revenue,
  });
}

class Gap {
  final String label;
  final String severity; // 'high' | 'medium' | 'low'
  final String? sectionId;
  Gap({required this.label, required this.severity, this.sectionId});
}

class BlueprintAggregator extends GetxService {
  final _data = Get.find<SectionDataProvider>();

  Blueprint build(List<KitModel> kits) {
    final visionForm = _data.getForm('formation.vision_mission');
    final pitchForm = _data.getForm('business.sales_pitch');

    final kitSummaries = <KitSummary>[];
    int totalSections = 0;
    int completedSections = 0;
    int trackersWithData = 0;

    for (final kit in kits) {
      final digests = <SectionDigest>[];
      int kitDone = 0;
      for (final s in kit.sections) {
        final records = _data.getRecords(s.id);
        final cells = _data.getCells(s.id);
        final form = _data.getForm(s.id);
        final isC = _data.isComplete(s.id);
        final hasData = records.isNotEmpty || cells.isNotEmpty || form.isNotEmpty;
        if (hasData) trackersWithData++;
        if (isC) kitDone++;
        digests.add(SectionDigest(
          section: s,
          recordCount: records.length,
          cellCount: cells.length,
          hasForm: form.isNotEmpty,
          isComplete: isC,
          records: records,
          form: form,
          cells: cells,
        ));
      }
      kitSummaries.add(KitSummary(
        kit: kit,
        completedSections: kitDone,
        totalSections: kit.sections.length,
        sections: digests,
      ));
      totalSections += kit.sections.length;
      completedSections += kitDone;
    }

    final finance = _buildFinance(kits);
    final pitch = _buildPitch(kits, finance, visionForm, pitchForm);
    final gaps = _detectGaps(kits, kitSummaries, visionForm);
    final next = _nextActions(kits, kitSummaries, gaps);
    final health = _healthScore(
      totalSections: totalSections,
      completedSections: completedSections,
      trackersWithData: trackersWithData,
      finance: finance,
    );

    return Blueprint(
      companyName: visionForm['company_name'] as String? ?? 'My Startup',
      tagline: visionForm['tagline'] as String?,
      vision: visionForm['vision'] as String?,
      mission: visionForm['mission'] as String?,
      coreValues: visionForm['core_values'] as String?,
      health: health,
      nextActions: next,
      kits: kitSummaries,
      finance: finance,
      pitch: pitch,
      gaps: gaps,
    );
  }

  // ── Finance ────────────────────────────────────────────────────────────────
  FinancialSummary _buildFinance(List<KitModel> kits) {
    final pnlCells = _data.getCells('finance.pnl');
    final teamRecords = _data.getRecords('finance.team_cost');
    final capexRecords = _data.getRecords('finance.capex');
    final leads = _data.getRecords('business.customer_matrix');

    double sumOf(String rowKey, List<String> cols) {
      double total = 0;
      for (final c in cols) {
        final v = pnlCells['$rowKey|$c'];
        if (v is num) total += v.toDouble();
        if (v is String) total += double.tryParse(v) ?? 0;
      }
      return total;
    }

    const y1Months = ['M1','M2','M3','M4','M5','M6','M7','M8','M9','M10','M11','M12'];
    final revenue = sumOf('revenue', y1Months);
    final opexInputs = ['opex_salaries','opex_rent','opex_marketing','opex_tech','opex_other'];
    double opex = 0;
    for (final k in opexInputs) {
      opex += sumOf(k, y1Months);
    }
    final cogs = sumOf('cogs', y1Months);
    final netProfit = revenue - cogs - opex;

    double capex = 0;
    for (final r in capexRecords) {
      final c = r['cost'];
      if (c is num) capex += c.toDouble();
      if (c is String) capex += double.tryParse(c) ?? 0;
    }

    return FinancialSummary(
      y1Revenue: revenue,
      y1Opex: opex,
      y1NetProfit: netProfit,
      teamCount: teamRecords.length,
      totalCapex: capex,
      leadsScored: leads.length,
      isProfitable: netProfit > 0,
    );
  }

  // ── Pitch ──────────────────────────────────────────────────────────────────
  InvestorPitch _buildPitch(
    List<KitModel> kits,
    FinancialSummary fin,
    Map<String, dynamic> vision,
    Map<String, dynamic> pitch,
  ) {
    // Best problem statement: prefer pitch problem_en, then pitch_feedback first record's problem, then vision mission
    final problem = pitch['problem_en'] as String? ??
        _firstRecordField('business.pitch_feedback', 'problem_statement') ??
        _firstRecordField('product.brd', 'problem');
    final solution = pitch['solution_en'] as String? ??
        vision['mission'] as String?;
    final whyUs = pitch['why_us_en'] as String?;
    final proof = pitch['proof'] as String?;
    final ask = pitch['ask'] as String?;

    // Market: top priority industry
    final industries = _data.getRecords('business.industry_analysis');
    String? market;
    if (industries.isNotEmpty) {
      industries.sort((a, b) {
        int rank(String? p) => p == null ? 9 : p.startsWith('A') ? 0 : p.startsWith('B') ? 1 : 2;
        return rank(a['priority'] as String?).compareTo(rank(b['priority'] as String?));
      });
      market = industries.first['industry'] as String?;
    }

    // Y3 revenue from PNL revenue Y3 column if present
    final pnlCells = _data.getCells('finance.pnl');
    double y3 = 0;
    final v = pnlCells['revenue|Y3'];
    if (v is num) y3 = v.toDouble();
    if (v is String) y3 = double.tryParse(v) ?? 0;

    return InvestorPitch(
      problem: problem,
      solution: solution,
      whyUs: whyUs,
      proof: proof,
      ask: ask,
      market: market,
      teamCount: fin.teamCount,
      customerCount: fin.leadsScored,
      y1Revenue: fin.y1Revenue,
      y3Revenue: y3,
    );
  }

  String? _firstRecordField(String sectionId, String field) {
    final r = _data.getRecords(sectionId);
    if (r.isEmpty) return null;
    final v = r.first[field];
    return v is String && v.isNotEmpty ? v : null;
  }

  // ── Gaps ───────────────────────────────────────────────────────────────────
  List<Gap> _detectGaps(
    List<KitModel> kits,
    List<KitSummary> summaries,
    Map<String, dynamic> visionForm,
  ) {
    final gaps = <Gap>[];

    // Critical foundational gaps
    if ((visionForm['company_name'] as String? ?? '').isEmpty) {
      gaps.add(Gap(
        label: 'Company name not set',
        severity: 'high',
        sectionId: 'formation.vision_mission',
      ));
    }
    if ((visionForm['vision'] as String? ?? '').isEmpty) {
      gaps.add(Gap(
        label: 'Vision statement missing',
        severity: 'high',
        sectionId: 'formation.vision_mission',
      ));
    }
    if ((visionForm['mission'] as String? ?? '').isEmpty) {
      gaps.add(Gap(
        label: 'Mission statement missing',
        severity: 'high',
        sectionId: 'formation.vision_mission',
      ));
    }

    // Empty key trackers
    final critical = <String, String>{
      'formation.team_roster': 'Team roster is empty',
      'business.customer_matrix': 'No leads scored yet',
      'finance.pnl': 'P&L has no numbers',
      'finance.team_cost': 'Team cost plan empty',
      'product.products': 'Product catalog empty',
    };
    for (final entry in critical.entries) {
      final r = _data.getRecords(entry.key);
      final cells = _data.getCells(entry.key);
      final form = _data.getForm(entry.key);
      if (r.isEmpty && cells.isEmpty && form.isEmpty) {
        gaps.add(Gap(
          label: entry.value,
          severity: 'high',
          sectionId: entry.key,
        ));
      }
    }

    // Medium severity: SOPs not adopted
    final sopAdoptedAny = kits
        .firstWhere((k) => k.id == 'sop',
            orElse: () => kits.first)
        .sections
        .any((s) => _data.getCells(s.id).isNotEmpty);
    if (!sopAdoptedAny) {
      gaps.add(Gap(
        label: 'No SOPs adopted',
        severity: 'medium',
      ));
    }

    return gaps;
  }

  // ── Next actions ───────────────────────────────────────────────────────────
  List<NextAction> _nextActions(
    List<KitModel> kits,
    List<KitSummary> summaries,
    List<Gap> gaps,
  ) {
    final actions = <NextAction>[];
    final all = {for (final k in kits) for (final s in k.sections) s.id: s};

    // From high gaps
    for (final g in gaps.where((g) => g.severity == 'high').take(3)) {
      final s = g.sectionId == null ? null : all[g.sectionId];
      actions.add(NextAction(
        title: g.label,
        reason: 'Critical gap — fix this first',
        kitId: s?.kitId ?? 'formation',
        section: s,
        priority: 1,
      ));
    }

    // Next: empty-but-important record-list trackers
    final importantEmpty = [
      'product.competitor',
      'business.industry_analysis',
      'procurement.vendor_matrix',
      'hr.candidate_tracker',
      'finance.opex',
    ];
    for (final id in importantEmpty) {
      final s = all[id];
      if (s == null) continue;
      final hasData = _data.getRecords(id).isNotEmpty ||
          _data.getCells(id).isNotEmpty ||
          _data.getForm(id).isNotEmpty;
      if (!hasData) {
        actions.add(NextAction(
          title: 'Start ${s.title}',
          reason: 'Recommended early-stage tracker',
          kitId: s.kitId,
          section: s,
          priority: 2,
        ));
      }
    }

    return actions.take(5).toList();
  }

  // ── Health score ───────────────────────────────────────────────────────────
  HealthScore _healthScore({
    required int totalSections,
    required int completedSections,
    required int trackersWithData,
    required FinancialSummary finance,
  }) {
    final completion =
        totalSections == 0 ? 0 : ((completedSections / totalSections) * 100).round();
    final dataPct =
        totalSections == 0 ? 0 : ((trackersWithData / totalSections) * 100).round();

    int financialSanity;
    if (finance.y1Revenue == 0 && finance.y1Opex == 0) {
      financialSanity = 0;
    } else if (finance.isProfitable) {
      financialSanity = 100;
    } else if (finance.y1Revenue >= finance.y1Opex * 0.5) {
      financialSanity = 60;
    } else {
      financialSanity = 30;
    }

    final overall =
        ((completion * 0.5) + (dataPct * 0.3) + (financialSanity * 0.2)).round();

    String label;
    if (overall >= 75) {
      label = 'Investor-Ready';
    } else if (overall >= 50) {
      label = 'Solid';
    } else if (overall >= 20) {
      label = 'Building';
    } else {
      label = 'Just Started';
    }

    return HealthScore(
      overallPercent: overall,
      completionPercent: completion,
      trackersWithDataPercent: dataPct,
      financialSanity: financialSanity,
      label: label,
    );
  }
}
