import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/models/kit_model.dart';
import '../../data/providers/progress_provider.dart';
import '../../widgets/responsive.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Get.find<ProgressProvider>();
    final cols = Breakpoints.gridColumns(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('All Kits'),
        scrolledUnderElevation: 0,
      ),
      body: Obx(
        () => ResponsiveSliverBody(
          wide: true,
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  mainAxisExtent: 220,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, i) =>
                      _KitTile(kit: startupKits[i], provider: provider),
                  childCount: startupKits.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KitTile extends StatelessWidget {
  final KitModel kit;
  final ProgressProvider provider;
  const _KitTile({required this.kit, required this.provider});

  @override
  Widget build(BuildContext context) {
    final progress = provider.getKitProgressFor(kit);
    final completedCount = provider.getKitCompletedCount(kit);
    final totalCount = provider.getKitTotalCount(kit);
    final isStarted = progress > 0;

    return HoverCard(
      onTap: () => Get.toNamed(Routes.moduleDetail, arguments: kit),
      borderRadius: BorderRadius.circular(AppRadius.xl),
      hoverShadowColor: kit.color,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.border),
          boxShadow: isStarted ? AppShadows.glow(kit.color) : AppShadows.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: AppGradients.forKit(kit.color),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    boxShadow: AppShadows.glow(kit.color),
                  ),
                  child: Icon(kit.icon, color: Colors.white, size: 22),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: kit.color.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                  child: Text(
                    '${(progress * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: kit.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              kit.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -0.3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              kit.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              kit.description,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.45,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: kit.color.withValues(alpha: 0.10),
                valueColor: AlwaysStoppedAnimation(kit.color),
                minHeight: 5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$completedCount of $totalCount · ${kit.lessons.length} lessons + ${kit.sections.length} trackers',
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
