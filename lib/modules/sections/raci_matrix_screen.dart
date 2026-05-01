import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';

/// RACI matrix: rows = activities (from `seedRows`), columns = roles
/// (from `colAxis`), each cell holds R/A/C/I/null.
class RaciMatrixScreen extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const RaciMatrixScreen({super.key, required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SectionDataProvider>();
    final activities = section.seedRows ?? const [];
    final roles = section.colAxis ?? const [];

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
      body: Obx(() {
        final cells = data.getCells(section.id);
        return ResponsiveContent(
          child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
          children: [
            _Legend(kitColor: kit.color, helpText: section.helpText),
            const SizedBox(height: 14),
            for (int i = 0; i < activities.length; i++) ...[
              _ActivityRow(
                kit: kit,
                index: i,
                activity: activities[i],
                roles: roles,
                cells: cells,
                onSet: (role, value) => data.setCell(
                  section.id,
                  activities[i]['key'] as String,
                  role,
                  value,
                ),
              ),
            ],
          ],
          ),
        );
      }),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color kitColor;
  final String? helpText;
  const _Legend({required this.kitColor, this.helpText});

  @override
  Widget build(BuildContext context) {
    Widget chip(String letter, String label) => Padding(
          padding: const EdgeInsets.only(right: 14, bottom: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kitColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  letter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              chip('R', 'Responsible'),
              chip('A', 'Accountable'),
              chip('C', 'Consulted'),
              chip('I', 'Informed'),
            ],
          ),
          if (helpText != null) ...[
            const SizedBox(height: 6),
            Text(
              helpText!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final KitModel kit;
  final int index;
  final Map<String, dynamic> activity;
  final List<String> roles;
  final Map<String, dynamic> cells;
  final void Function(String role, String? value) onSet;

  const _ActivityRow({
    required this.kit,
    required this.index,
    required this.activity,
    required this.roles,
    required this.cells,
    required this.onSet,
  });

  @override
  Widget build(BuildContext context) {
    final actKey = activity['key'] as String;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kit.color.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: kit.color,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  activity['activity'] as String? ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final role in roles)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      role,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: _RaciSelector(
                      value: cells['$actKey|$role'] as String?,
                      kitColor: kit.color,
                      onChanged: (v) => onSet(role, v),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _RaciSelector extends StatelessWidget {
  final String? value;
  final Color kitColor;
  final ValueChanged<String?> onChanged;
  const _RaciSelector(
      {required this.value, required this.kitColor, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const opts = ['R', 'A', 'C', 'I'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (final o in opts) ...[
          GestureDetector(
            onTap: () => onChanged(value == o ? null : o),
            child: Container(
              width: 32,
              height: 30,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                color: value == o ? kitColor : AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: value == o ? kitColor : AppColors.border),
              ),
              child: Text(
                o,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: value == o ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
