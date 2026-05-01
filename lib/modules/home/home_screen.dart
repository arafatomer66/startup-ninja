import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/models/kit_model.dart';
import '../../data/providers/progress_provider.dart';
import '../../data/services/blueprint_aggregator.dart';
import '../../widgets/responsive.dart';
import 'widgets/next_action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Get.find<ProgressProvider>();
    final aggregator = Get.find<BlueprintAggregator>();

    return Obx(() {
      final total = startupKits.fold<int>(
          0, (s, k) => s + provider.getKitTotalCount(k));
      final completed = startupKits.fold<int>(
          0, (s, k) => s + provider.getKitCompletedCount(k));
      final percent = total > 0 ? (completed / total).clamp(0.0, 1.0) : 0.0;

      final cols = Breakpoints.isDesktop(context)
          ? 2
          : 1;

      return Scaffold(
        backgroundColor: AppColors.background,
        body: ResponsiveSliverBody(
          wide: true,
          slivers: [
            SliverToBoxAdapter(
              child: _HeroHeader(
                userName: provider.userName,
                completed: completed,
                total: total,
                percent: percent,
              ),
            ),
            SliverToBoxAdapter(
              child: _QuickStats(
                  completed: completed, total: total, percent: percent),
            ),
            SliverToBoxAdapter(
              child: NextActionCard(
                blueprint: aggregator.build(startupKits),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Learning Kits',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.modules),
                      child: const Text(
                        'See all  →',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  // Tighter for narrow phones, taller for desktop two-cols
                  mainAxisExtent: cols == 1 ? 132 : 142,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, i) =>
                      _KitCard(kit: startupKits[i], provider: provider),
                  childCount: startupKits.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 56)),
          ],
        ),
      );
    });
  }
}

class _HeroHeader extends StatelessWidget {
  final String userName;
  final int completed;
  final int total;
  final double percent;

  const _HeroHeader({
    required this.userName,
    required this.completed,
    required this.total,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.hero,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -40,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hey, $userName 👋',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Ready to build your startup?',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.profile),
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                            ),
                          ),
                          child: const Icon(Icons.person_rounded,
                              color: Colors.white, size: 22),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Progress card
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Overall Progress',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '$completed of $total items',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: LinearProgressIndicator(
                                  value: percent,
                                  backgroundColor:
                                      Colors.white.withValues(alpha: 0.25),
                                  valueColor:
                                      const AlwaysStoppedAnimation(Colors.white),
                                  minHeight: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircularPercentIndicator(
                          radius: 44,
                          lineWidth: 6,
                          percent: percent,
                          center: Text(
                            '${(percent * 100).toInt()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          progressColor: Colors.white,
                          backgroundColor: Colors.white.withValues(alpha: 0.25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickStats extends StatelessWidget {
  final int completed;
  final int total;
  final double percent;

  const _QuickStats({
    required this.completed,
    required this.total,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = total - completed;
    final kitsStarted = startupKits
        .where((k) =>
            Get.find<ProgressProvider>().getKitProgressFor(k) > 0)
        .length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
      child: Row(
        children: [
          _StatTile(
            value: '$completed',
            label: 'Completed',
            color: AppColors.success,
            icon: Icons.check_circle_rounded,
          ),
          const SizedBox(width: 12),
          _StatTile(
            value: '$remaining',
            label: 'Remaining',
            color: AppColors.warning,
            icon: Icons.pending_rounded,
          ),
          const SizedBox(width: 12),
          _StatTile(
            value: '$kitsStarted',
            label: 'Kits Started',
            color: AppColors.primary,
            icon: Icons.layers_rounded,
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;

  const _StatTile({
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KitCard extends StatelessWidget {
  final KitModel kit;
  final ProgressProvider provider;

  const _KitCard({required this.kit, required this.provider});

  @override
  Widget build(BuildContext context) {
    final progress = provider.getKitProgressFor(kit);
    final completedCount = provider.getKitCompletedCount(kit);
    final totalCount = provider.getKitTotalCount(kit);
    final isStarted = progress > 0;
    final isCompleted = progress >= 1.0;

    return HoverCard(
      onTap: () => Get.toNamed(Routes.moduleDetail, arguments: kit),
      borderRadius: BorderRadius.circular(AppRadius.xl),
      hoverShadowColor: kit.color,
      hoverElevation: 16,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: isCompleted
                ? kit.color.withValues(alpha: 0.4)
                : AppColors.border,
          ),
          boxShadow: isStarted ? AppShadows.glow(kit.color) : AppShadows.sm,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: AppGradients.forKit(kit.color),
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      boxShadow: AppShadows.glow(kit.color),
                    ),
                    child: Icon(kit.icon, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                kit.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                  letterSpacing: -0.3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isCompleted)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.success
                                      .withValues(alpha: 0.12),
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.xs),
                                ),
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.success,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          kit.subtitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Progress bar at bottom
            Container(
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.background,
              ),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: kit.color.withValues(alpha: 0.1),
                        valueColor: AlwaysStoppedAnimation(kit.color),
                        minHeight: 5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '$completedCount/$totalCount',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: isStarted ? kit.color : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
