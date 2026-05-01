import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';

/// Financial grid: rows = particulars (from `seedRows`, each with optional
/// `formula: "sum"`), columns = months / years (from `colAxis`). Each cell is
/// a number stored at `<rowKey>|<col>`. Sum rows are computed from siblings.
class FinancialGridScreen extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const FinancialGridScreen(
      {super.key, required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SectionDataProvider>();
    final rows = section.seedRows ?? const [];
    final cols = section.colAxis ?? const [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          section.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ResponsiveContent(
        child: Obx(() {
        final scenario = data.activeScenario.value;
        final cells = data.getCells(section.id, scenario: scenario);

        // Compute totals for any row marked as a sum aggregator
        double rowTotal(Map<String, dynamic> row, String col) {
          if (row['formula'] == 'sum') {
            final inputs = (row['inputs'] as List?)?.cast<String>() ?? const [];
            double sum = 0;
            for (final k in inputs) {
              final v = cells['$k|$col'];
              if (v is num) sum += v.toDouble();
              if (v is String) sum += double.tryParse(v) ?? 0;
            }
            return sum;
          }
          final v = cells['${row["key"]}|$col'];
          if (v is num) return v.toDouble();
          if (v is String) return double.tryParse(v) ?? 0;
          return 0;
        }

        return Column(
          children: [
            _ScenarioSwitcher(
              kitColor: kit.color,
              active: scenario,
              onChange: data.setActiveScenario,
            ),
            if (section.helpText != null)
              Container(
                margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kit.color.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                  border:
                      Border.all(color: kit.color.withValues(alpha: 0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb_rounded, color: kit.color, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        section.helpText!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textPrimary,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 32),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(
                          kit.color.withValues(alpha: 0.06)),
                      headingTextStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: kit.color,
                        letterSpacing: 0.4,
                      ),
                      columnSpacing: 18,
                      columns: [
                        const DataColumn(label: Text('PARTICULARS')),
                        for (final c in cols)
                          DataColumn(label: Text(c.toUpperCase())),
                      ],
                      rows: [
                        for (final row in rows)
                          DataRow(
                            color: row['formula'] == 'sum'
                                ? WidgetStateProperty.all(kit.color
                                    .withValues(alpha: 0.04))
                                : null,
                            cells: [
                              DataCell(
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  child: Text(
                                    row['label'] as String? ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: row['formula'] == 'sum'
                                          ? FontWeight.w800
                                          : FontWeight.w600,
                                      color: row['formula'] == 'sum'
                                          ? kit.color
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              for (final c in cols)
                                DataCell(
                                  row['formula'] == 'sum'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            _fmt(rowTotal(row, c)),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: kit.color,
                                            ),
                                          ),
                                        )
                                      : _CellInput(
                                          // Re-key by scenario so the controller resets
                                          // when the user switches scenarios.
                                          key: ValueKey(
                                              '${row["key"]}|$c|${scenario.name}'),
                                          initial: cells['${row["key"]}|$c']
                                                  ?.toString() ??
                                              '',
                                          onChanged: (v) => data.setCell(
                                              section.id,
                                              row['key'] as String,
                                              c,
                                              double.tryParse(v) ?? 0,
                                              scenario: scenario),
                                        ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      ),
    );
  }

  String _fmt(double v) {
    if (v.abs() >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v.abs() >= 1000) return '${(v / 1000).toStringAsFixed(1)}K';
    if (v == v.roundToDouble()) return v.toStringAsFixed(0);
    return v.toStringAsFixed(2);
  }
}

class _ScenarioSwitcher extends StatelessWidget {
  final Color kitColor;
  final FinanceScenario active;
  final ValueChanged<FinanceScenario> onChange;

  const _ScenarioSwitcher({
    required this.kitColor,
    required this.active,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    Widget chip(FinanceScenario s, String label, IconData icon) {
      final on = s == active;
      return Expanded(
        child: GestureDetector(
          onTap: () => onChange(s),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(vertical: 9),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: on ? kitColor : AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: on ? kitColor : AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    size: 14, color: on ? Colors.white : kitColor),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: on ? Colors.white : AppColors.textSecondary,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      child: Row(
        children: [
          chip(FinanceScenario.conservative, 'Conservative',
              Icons.shield_rounded),
          chip(FinanceScenario.base, 'Base', Icons.balance_rounded),
          chip(FinanceScenario.optimistic, 'Optimistic',
              Icons.rocket_launch_rounded),
        ],
      ),
    );
  }
}

class _CellInput extends StatefulWidget {
  final String initial;
  final ValueChanged<String> onChanged;
  const _CellInput({super.key, required this.initial, required this.onChanged});

  @override
  State<_CellInput> createState() => _CellInputState();
}

class _CellInputState extends State<_CellInput> {
  late TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.initial);
  }

  @override
  void didUpdateWidget(covariant _CellInput old) {
    super.didUpdateWidget(old);
    if (widget.initial != _ctrl.text && !_ctrl.value.composing.isValid) {
      _ctrl.text = widget.initial;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: TextField(
        controller: _ctrl,
        textAlign: TextAlign.right,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.\-]')),
        ],
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          border: OutlineInputBorder(),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
