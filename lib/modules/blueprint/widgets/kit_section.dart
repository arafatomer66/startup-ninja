import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../../data/models/section_model.dart';
import '../../../data/services/blueprint_aggregator.dart';

class KitSectionView extends StatelessWidget {
  final KitSummary summary;
  final void Function(SectionModel section) onTapSection;
  const KitSectionView(
      {super.key, required this.summary, required this.onTapSection});

  @override
  Widget build(BuildContext context) {
    final kit = summary.kit;
    final pct = summary.totalSections == 0
        ? 0
        : ((summary.completedSections / summary.totalSections) * 100).round();

    final filledDigests =
        summary.sections.where((d) => _hasData(d)).toList();

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppGradients.forKit(kit.color),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.35)),
                  ),
                  child: Icon(kit.icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kit.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${summary.completedSections}/${summary.totalSections} trackers · $pct%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (filledDigests.isEmpty)
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                'No data yet for ${kit.title.toLowerCase()}.',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final d in filledDigests)
                    _DigestTile(
                      digest: d,
                      kitColor: kit.color,
                      onTap: () => onTapSection(d.section),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  bool _hasData(SectionDigest d) =>
      d.recordCount > 0 || d.cellCount > 0 || d.hasForm;
}

class _DigestTile extends StatelessWidget {
  final SectionDigest digest;
  final Color kitColor;
  final VoidCallback onTap;
  const _DigestTile({
    required this.digest,
    required this.kitColor,
    required this.onTap,
  });

  String _summary() {
    final s = digest.section;
    switch (s.pattern) {
      case SectionPattern.recordList:
      case SectionPattern.catalog:
        return _recordSummary();
      case SectionPattern.singleForm:
        return _formSummary();
      case SectionPattern.checklist:
        final total = s.seedRows?.length ?? 0;
        final done = digest.cellCount;
        return total > 0 ? '$done of $total checked' : '$done checked';
      case SectionPattern.raciMatrix:
        final total = (s.seedRows?.length ?? 0) * (s.colAxis?.length ?? 0);
        return total > 0
            ? '${digest.cellCount}/$total cells assigned'
            : '${digest.cellCount} cells set';
      case SectionPattern.sopProcess:
        final total = s.seedRows?.length ?? 0;
        return total > 0
            ? '${digest.cellCount} of $total steps adopted'
            : '${digest.cellCount} steps';
      case SectionPattern.financialGrid:
        return '${digest.cellCount} values entered';
      case SectionPattern.roadmap:
        return '${digest.recordCount} item${digest.recordCount == 1 ? "" : "s"} on roadmap';
    }
  }

  String _recordSummary() {
    final n = digest.recordCount;
    if (n == 0) return 'Empty';
    final fields = digest.section.fields;
    if (fields.isEmpty) return '$n entr${n == 1 ? "y" : "ies"}';
    final firstKey = fields.first.key;
    final preview = digest.records
        .take(3)
        .map((r) => r[firstKey]?.toString())
        .where((v) => v != null && v.isNotEmpty)
        .join(', ');
    return preview.isEmpty
        ? '$n entr${n == 1 ? "y" : "ies"}'
        : '$n: $preview${n > 3 ? '…' : ''}';
  }

  String _formSummary() {
    final keyFields =
        digest.section.fields.where((f) => f.required).toList();
    if (keyFields.isEmpty) {
      return digest.hasForm ? 'Saved' : 'Not started';
    }
    final value = digest.form[keyFields.first.key]?.toString();
    return (value == null || value.isEmpty) ? 'Saved' : value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 32,
              decoration: BoxDecoration(
                color: digest.isComplete ? kitColor : kitColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    digest.section.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _summary(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppColors.textHint, size: 18),
          ],
        ),
      ),
    );
  }
}
