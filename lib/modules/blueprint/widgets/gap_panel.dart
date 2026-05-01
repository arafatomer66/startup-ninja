import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../../data/services/blueprint_aggregator.dart';

class GapPanel extends StatelessWidget {
  final List<Gap> gaps;
  final void Function(String sectionId) onTap;
  const GapPanel({super.key, required this.gaps, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final highs = gaps.where((g) => g.severity == 'high').toList();
    final mediums = gaps.where((g) => g.severity == 'medium').toList();
    final color = highs.isNotEmpty ? AppColors.accent : AppColors.warning;

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                'What\'s Missing',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${gaps.length}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (final g in [...highs, ...mediums]) _GapTile(gap: g, onTap: onTap),
        ],
      ),
    );
  }
}

class _GapTile extends StatelessWidget {
  final Gap gap;
  final void Function(String sectionId) onTap;
  const _GapTile({required this.gap, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = gap.severity == 'high' ? AppColors.accent : AppColors.warning;
    return GestureDetector(
      onTap: gap.sectionId == null ? null : () => onTap(gap.sectionId!),
      child: Container(
        margin: const EdgeInsets.only(top: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                gap.label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            if (gap.sectionId != null)
              const Icon(Icons.chevron_right_rounded,
                  color: AppColors.textHint, size: 18),
          ],
        ),
      ),
    );
  }
}
