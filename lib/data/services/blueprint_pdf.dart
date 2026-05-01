import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/section_model.dart';
import 'blueprint_aggregator.dart';

class BlueprintPdf {
  static const _accent = PdfColor.fromInt(0xFF5B4FE8);
  static const _ink = PdfColor.fromInt(0xFF1C1644);
  static const _muted = PdfColor.fromInt(0xFF7B74A8);
  static const _bg = PdfColor.fromInt(0xFFF5F4FF);

  static Future<void> share(Blueprint blueprint) async {
    final pdf = await build(blueprint);
    await Printing.sharePdf(
      bytes: pdf,
      filename: '${_safeFilename(blueprint.companyName)}-Blueprint.pdf',
    );
  }

  static String _safeFilename(String s) {
    final cleaned = s.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_');
    return cleaned.isEmpty ? 'Startup' : cleaned;
  }

  static String _fmtMoney(double v) {
    final neg = v < 0;
    final n = v.abs();
    String s;
    if (n >= 10000000) {
      s = '${(n / 10000000).toStringAsFixed(2)} Cr';
    } else if (n >= 100000) {
      s = '${(n / 100000).toStringAsFixed(1)} L';
    } else if (n >= 1000) {
      s = '${(n / 1000).toStringAsFixed(1)}K';
    } else {
      s = n.toStringAsFixed(0);
    }
    return '${neg ? "-" : ""}BDT $s';
  }

  static Future<Uint8List> build(Blueprint blueprint) async {
    final doc = pw.Document();

    doc.addPage(pw.MultiPage(
      pageTheme: pw.PageTheme(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(40, 40, 40, 40),
      ),
      header: (ctx) => pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 14),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              blueprint.companyName,
              style: pw.TextStyle(
                  color: _accent, fontSize: 11, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              'Startup Blueprint',
              style: const pw.TextStyle(color: _muted, fontSize: 10),
            ),
          ],
        ),
      ),
      footer: (ctx) => pw.Container(
        alignment: pw.Alignment.centerRight,
        margin: const pw.EdgeInsets.only(top: 8),
        child: pw.Text(
          'Page ${ctx.pageNumber} of ${ctx.pagesCount}',
          style: const pw.TextStyle(color: _muted, fontSize: 9),
        ),
      ),
      build: (ctx) => [
        _coverSection(blueprint),
        ..._healthSection(blueprint),
        if (blueprint.gaps.isNotEmpty) ..._gapsSection(blueprint),
        ..._financeSection(blueprint),
        ..._pitchSection(blueprint),
        ..._kitSections(blueprint),
      ],
    ));

    return doc.save();
  }

  // ── Cover ──────────────────────────────────────────────────────────────────
  static pw.Widget _coverSection(Blueprint b) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(24),
      margin: const pw.EdgeInsets.only(bottom: 20),
      decoration: pw.BoxDecoration(
        color: _accent,
        borderRadius: pw.BorderRadius.circular(12),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            b.companyName,
            style: pw.TextStyle(
              color: PdfColors.white,
              fontSize: 28,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          if (b.tagline != null && b.tagline!.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            pw.Text(
              b.tagline!,
              style: const pw.TextStyle(
                color: PdfColors.white,
                fontSize: 13,
              ),
            ),
          ],
          pw.SizedBox(height: 14),
          pw.Container(
            padding:
                const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: pw.BoxDecoration(
              color: PdfColor(1, 1, 1, 0.2),
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Text(
              'Health: ${b.health.overallPercent}% — ${b.health.label}',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          if (b.vision != null && b.vision!.isNotEmpty) ...[
            pw.SizedBox(height: 16),
            _coverBox('VISION', b.vision!),
          ],
          if (b.mission != null && b.mission!.isNotEmpty) ...[
            pw.SizedBox(height: 8),
            _coverBox('MISSION', b.mission!),
          ],
          if (b.coreValues != null && b.coreValues!.isNotEmpty) ...[
            pw.SizedBox(height: 8),
            _coverBox('CORE VALUES', b.coreValues!),
          ],
        ],
      ),
    );
  }

  static pw.Widget _coverBox(String label, String body) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: PdfColor(1, 1, 1, 0.13),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            label,
            style: pw.TextStyle(
              color: PdfColor(1, 1, 1, 0.85),
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            body,
            style: const pw.TextStyle(
              color: PdfColors.white,
              fontSize: 11,
              lineSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  // ── Health ─────────────────────────────────────────────────────────────────
  static List<pw.Widget> _healthSection(Blueprint b) {
    return [
      _h2('Health Score'),
      pw.SizedBox(height: 6),
      _statRow('Overall', b.health.overallPercent),
      _statRow('Completion', b.health.completionPercent),
      _statRow('Trackers with data', b.health.trackersWithDataPercent),
      _statRow('Financial sanity', b.health.financialSanity),
      pw.SizedBox(height: 16),
    ];
  }

  static pw.Widget _statRow(String label, int value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 3),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 130,
            child: pw.Text(label,
                style: const pw.TextStyle(color: _muted, fontSize: 11)),
          ),
          pw.Expanded(
            child: pw.LayoutBuilder(
              builder: (ctx, constraints) {
                final w = constraints?.maxWidth ?? 200;
                return pw.Stack(
                  children: [
                    pw.Container(
                      width: w,
                      height: 6,
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromInt(0xFFE8E6FF),
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.Container(
                      width: (w * (value / 100)).clamp(0, w),
                      height: 6,
                      decoration: pw.BoxDecoration(
                        color: _accent,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          pw.SizedBox(width: 8),
          pw.SizedBox(
            width: 32,
            child: pw.Text('$value%',
                textAlign: pw.TextAlign.right,
                style: pw.TextStyle(
                    color: _ink, fontSize: 11, fontWeight: pw.FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // ── Gaps ───────────────────────────────────────────────────────────────────
  static List<pw.Widget> _gapsSection(Blueprint b) {
    return [
      _h2("What's Missing"),
      pw.SizedBox(height: 6),
      ...b.gaps.map((g) => pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 3),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 4, right: 6),
                  width: 6,
                  height: 6,
                  decoration: pw.BoxDecoration(
                    color: g.severity == 'high'
                        ? PdfColor.fromInt(0xFFFF5C7A)
                        : PdfColor.fromInt(0xFFFFB547),
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Expanded(
                  child: pw.Text(
                    g.label,
                    style: const pw.TextStyle(
                        color: _ink, fontSize: 11, lineSpacing: 1.5),
                  ),
                ),
              ],
            ),
          )),
      pw.SizedBox(height: 16),
    ];
  }

  // ── Finance ────────────────────────────────────────────────────────────────
  static List<pw.Widget> _financeSection(Blueprint b) {
    final f = b.finance;
    return [
      _h2('Year 1 Financials'),
      pw.SizedBox(height: 8),
      pw.Row(
        children: [
          _metricBox('Revenue', _fmtMoney(f.y1Revenue)),
          _metricBox('OPEX', _fmtMoney(f.y1Opex)),
          _metricBox(
            'Net Profit',
            _fmtMoney(f.y1NetProfit),
            color: f.isProfitable
                ? PdfColor.fromInt(0xFF00C48C)
                : PdfColor.fromInt(0xFFFF5C7A),
          ),
        ],
      ),
      pw.SizedBox(height: 8),
      pw.Row(
        children: [
          _metricBox('Team', '${f.teamCount} hires'),
          _metricBox('CAPEX', _fmtMoney(f.totalCapex)),
          _metricBox('Leads scored', '${f.leadsScored}'),
        ],
      ),
      pw.SizedBox(height: 16),
    ];
  }

  static pw.Widget _metricBox(String label, String value, {PdfColor? color}) {
    return pw.Expanded(
      child: pw.Container(
        margin: const pw.EdgeInsets.symmetric(horizontal: 3),
        padding: const pw.EdgeInsets.all(10),
        decoration: pw.BoxDecoration(
          color: _bg,
          borderRadius: pw.BorderRadius.circular(8),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              label.toUpperCase(),
              style: pw.TextStyle(
                color: _muted,
                fontSize: 8,
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.6,
              ),
            ),
            pw.SizedBox(height: 3),
            pw.Text(
              value,
              style: pw.TextStyle(
                color: color ?? _ink,
                fontSize: 13,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Pitch ──────────────────────────────────────────────────────────────────
  static List<pw.Widget> _pitchSection(Blueprint b) {
    final p = b.pitch;
    final items = <_PitchEntry>[
      _PitchEntry('Problem', p.problem),
      _PitchEntry('Solution', p.solution),
      _PitchEntry('Market', p.market),
      _PitchEntry('Why Us', p.whyUs),
      _PitchEntry('Proof', p.proof),
      _PitchEntry('The Ask', p.ask),
    ];

    return [
      _h2('Investor Pitch Summary'),
      pw.SizedBox(height: 6),
      ...items.where((e) => e.body != null && e.body!.isNotEmpty).map(
            (e) => pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    e.label.toUpperCase(),
                    style: pw.TextStyle(
                      color: _accent,
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  pw.SizedBox(height: 2),
                  pw.Text(
                    e.body!,
                    style: const pw.TextStyle(
                        color: _ink, fontSize: 11, lineSpacing: 1.5),
                  ),
                ],
              ),
            ),
          ),
      pw.SizedBox(height: 16),
    ];
  }

  // ── Per-kit narrative ──────────────────────────────────────────────────────
  static List<pw.Widget> _kitSections(Blueprint b) {
    final widgets = <pw.Widget>[];
    for (final summary in b.kits) {
      final filled = summary.sections
          .where((d) => d.recordCount > 0 || d.cellCount > 0 || d.hasForm)
          .toList();
      if (filled.isEmpty) continue;
      widgets.add(_h2(summary.kit.title));
      widgets.add(pw.SizedBox(height: 4));
      widgets.add(pw.Text(
        '${summary.completedSections}/${summary.totalSections} trackers completed',
        style: const pw.TextStyle(color: _muted, fontSize: 10),
      ));
      widgets.add(pw.SizedBox(height: 10));
      for (final d in filled) {
        widgets.add(_sectionDigest(d));
        widgets.add(pw.SizedBox(height: 8));
      }
      widgets.add(pw.SizedBox(height: 10));
    }
    return widgets;
  }

  static pw.Widget _sectionDigest(SectionDigest d) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColor.fromInt(0xFFE8E6FF), width: 0.8),
        borderRadius: pw.BorderRadius.circular(6),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            d.section.title,
            style: pw.TextStyle(
                color: _ink, fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 6),
          ..._digestBody(d),
        ],
      ),
    );
  }

  static List<pw.Widget> _digestBody(SectionDigest d) {
    switch (d.section.pattern) {
      case SectionPattern.recordList:
      case SectionPattern.catalog:
        return _renderTable(d);
      case SectionPattern.singleForm:
        return _renderForm(d);
      case SectionPattern.checklist:
        return _renderChecklist(d);
      case SectionPattern.raciMatrix:
        return _renderCount('${d.cellCount} role assignments captured');
      case SectionPattern.sopProcess:
        final total = d.section.seedRows?.length ?? 0;
        return _renderCount(
            '${d.cellCount} of $total SOP steps marked as adopted');
      case SectionPattern.financialGrid:
        return _renderCount('${d.cellCount} numeric values entered');
      case SectionPattern.roadmap:
        return _renderRoadmap(d);
    }
  }

  static List<pw.Widget> _renderTable(SectionDigest d) {
    final fields = d.section.fields.take(4).toList();
    if (fields.isEmpty || d.records.isEmpty) {
      return [pw.Text('${d.recordCount} entries', style: _smallMuted())];
    }
    final rows = d.records.take(20).toList();
    return [
      pw.Table(
        border: pw.TableBorder.all(
            color: PdfColor.fromInt(0xFFE8E6FF), width: 0.4),
        children: [
          pw.TableRow(
            decoration: const pw.BoxDecoration(color: _bg),
            children: fields
                .map((f) => pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        f.label,
                        style: pw.TextStyle(
                          color: _ink,
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ))
                .toList(),
          ),
          ...rows.map((r) => pw.TableRow(
                children: fields
                    .map((f) => pw.Padding(
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Text(
                            r[f.key]?.toString() ?? '',
                            style: const pw.TextStyle(color: _ink, fontSize: 9),
                          ),
                        ))
                    .toList(),
              )),
        ],
      ),
      if (d.records.length > 20)
        pw.Padding(
          padding: const pw.EdgeInsets.only(top: 4),
          child: pw.Text(
            '+ ${d.records.length - 20} more entries',
            style: _smallMuted(),
          ),
        ),
    ];
  }

  static List<pw.Widget> _renderForm(SectionDigest d) {
    final entries = d.section.fields
        .where((f) {
          final v = d.form[f.key];
          return v != null && v.toString().isNotEmpty;
        })
        .toList();
    if (entries.isEmpty) {
      return [pw.Text('No data', style: _smallMuted())];
    }
    return entries
        .map((f) => pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 2),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    width: 110,
                    child: pw.Text(f.label,
                        style: const pw.TextStyle(
                            color: _muted, fontSize: 10)),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      d.form[f.key].toString(),
                      style: const pw.TextStyle(
                          color: _ink, fontSize: 10, lineSpacing: 1.4),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  static List<pw.Widget> _renderChecklist(SectionDigest d) {
    final items = d.section.seedRows ?? const [];
    return items.map((it) {
      final key = it['key'] as String;
      final on = d.cells['$key|value'] == true;
      return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 1),
        child: pw.Row(
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(right: 6),
              width: 9,
              height: 9,
              decoration: pw.BoxDecoration(
                color: on ? _accent : PdfColors.white,
                border: pw.Border.all(
                    color: on ? _accent : PdfColor.fromInt(0xFFB0ABCC),
                    width: 0.8),
                borderRadius: pw.BorderRadius.circular(2),
              ),
            ),
            pw.Expanded(
              child: pw.Text(
                it['label'] as String,
                style: pw.TextStyle(
                  color: on ? _muted : _ink,
                  fontSize: 10,
                  decoration: on
                      ? pw.TextDecoration.lineThrough
                      : pw.TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static List<pw.Widget> _renderRoadmap(SectionDigest d) {
    if (d.records.isEmpty) {
      return [pw.Text('Empty', style: _smallMuted())];
    }
    return d.records.take(15).map((r) {
      final title = r['title']?.toString() ?? 'Untitled';
      final start = r['start_period'] ?? '';
      final end = r['end_period'] ?? '';
      final priority = r['priority'] ?? '';
      return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 2),
        child: pw.Row(
          children: [
            pw.Expanded(
              child: pw.Text(title,
                  style: pw.TextStyle(
                    color: _ink,
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                  )),
            ),
            pw.Text(
              '$start → $end · $priority',
              style: const pw.TextStyle(color: _muted, fontSize: 9),
            ),
          ],
        ),
      );
    }).toList();
  }

  static List<pw.Widget> _renderCount(String text) {
    return [pw.Text(text, style: _smallMuted())];
  }

  static pw.TextStyle _smallMuted() =>
      const pw.TextStyle(color: _muted, fontSize: 10);

  static pw.Widget _h2(String text) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 6, bottom: 2),
      padding: const pw.EdgeInsets.only(bottom: 4),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: _accent, width: 1.5),
        ),
      ),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          color: _ink,
          fontSize: 16,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }
}

class _PitchEntry {
  final String label;
  final String? body;
  _PitchEntry(this.label, this.body);
}
