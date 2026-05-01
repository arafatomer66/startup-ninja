import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';

/// Checklist pattern: a fixed list of items (from `seedRows`), with each item
/// either Y/N or a small set of states. State is stored as cells keyed by
/// `"<itemKey>|<contextKey>"`. For a simple per-item checklist (no row context),
/// the contextKey is "value".
class ChecklistScreen extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const ChecklistScreen({super.key, required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SectionDataProvider>();
    final items = section.seedRows ?? const [];

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
        final completed =
            items.where((it) => cells['${it["key"]}|value'] == true).length;
        final total = items.length;

        return ResponsiveContent(
          child: Column(
          children: [
            _ProgressBanner(
              kitColor: kit.color,
              completed: completed,
              total: total,
              helpText: section.helpText,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final item = items[i];
                  final key = item['key'] as String;
                  final on = cells['$key|value'] == true;
                  return _ChecklistTile(
                    kit: kit,
                    label: item['label'] as String,
                    description: item['description'] as String?,
                    checked: on,
                    onTap: () =>
                        data.setCell(section.id, key, 'value', !on),
                  );
                },
              ),
            ),
          ],
        ),
        );
      }),
    );
  }
}

class _ProgressBanner extends StatelessWidget {
  final Color kitColor;
  final int completed;
  final int total;
  final String? helpText;
  const _ProgressBanner({
    required this.kitColor,
    required this.completed,
    required this.total,
    this.helpText,
  });

  @override
  Widget build(BuildContext context) {
    final pct = total == 0 ? 0.0 : completed / total;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kitColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kitColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.checklist_rounded, color: kitColor, size: 20),
              const SizedBox(width: 10),
              Text(
                '$completed of $total complete',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: kitColor,
                ),
              ),
              const Spacer(),
              Text(
                '${(pct * 100).round()}%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: kitColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct,
              backgroundColor: kitColor.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation(kitColor),
              minHeight: 6,
            ),
          ),
          if (helpText != null) ...[
            const SizedBox(height: 12),
            Text(
              helpText!,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.45,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  final KitModel kit;
  final String label;
  final String? description;
  final bool checked;
  final VoidCallback onTap;
  const _ChecklistTile({
    required this.kit,
    required this.label,
    required this.description,
    required this.checked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: checked
              ? kit.color.withValues(alpha: 0.06)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: checked
                ? kit.color.withValues(alpha: 0.4)
                : AppColors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: checked ? kit.color : AppColors.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: checked ? kit.color : AppColors.border,
                  width: 1.5,
                ),
              ),
              child: checked
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 18)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: checked ? kit.color : AppColors.textPrimary,
                      decoration: checked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: kit.color,
                      decorationThickness: 2,
                    ),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      description!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
