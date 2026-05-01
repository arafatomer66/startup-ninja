import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/models/kit_model.dart';
import '../../data/providers/progress_provider.dart';
import '../../widgets/responsive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Get.find<ProgressProvider>();

    return Obx(() {
      final total = startupKits.fold<int>(
          0, (s, k) => s + provider.getKitTotalCount(k));
      final completed = startupKits.fold<int>(
          0, (s, k) => s + provider.getKitCompletedCount(k));
      final percent = total > 0 ? (completed / total).clamp(0.0, 1.0) : 0.0;

      String level = 'Beginner Ninja';
      if (percent >= 0.8) {
        level = 'Master Ninja 🥷';
      } else if (percent >= 0.5) {
        level = 'Skilled Ninja ⚡';
      } else if (percent >= 0.2) {
        level = 'Rising Ninja 🚀';
      }

      return Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveSliverBody(
        slivers: [
          // Profile header
          SliverToBoxAdapter(
            child: Container(
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
                    right: -30,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.07),
                      ),
                    ),
                  ),
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Colors.white, size: 16),
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(width: 38),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  width: 2),
                            ),
                            child: const Icon(Icons.person_rounded,
                                color: Colors.white, size: 40),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            provider.userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              level,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Stats
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: Row(
                children: [
                  _StatBox(
                    value: '$completed',
                    label: 'Completed',
                    color: AppColors.success,
                    icon: Icons.check_circle_rounded,
                  ),
                  const SizedBox(width: 10),
                  _StatBox(
                    value: '${total - completed}',
                    label: 'Remaining',
                    color: AppColors.warning,
                    icon: Icons.pending_rounded,
                  ),
                  const SizedBox(width: 10),
                  _StatBox(
                    value: '${(percent * 100).toInt()}%',
                    label: 'Complete',
                    color: AppColors.primary,
                    icon: Icons.trending_up_rounded,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  icon: const Icon(Icons.description_rounded, size: 18),
                  label: const Text('View Startup Blueprint'),
                  onPressed: () => Get.toNamed(Routes.blueprint),
                ),
              ),
            ),
          ),
          // Kit progress
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
              child: const Text(
                'Kit Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final kit = startupKits[i];
                  final p = provider.getKitProgressFor(kit);
                  final doneCount = provider.getKitCompletedCount(kit);
                  final kitTotal = provider.getKitTotalCount(kit);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: p >= 1.0
                            ? kit.color.withValues(alpha: 0.3)
                            : AppColors.border,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: AppGradients.forKit(kit.color),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(kit.icon, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    kit.title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    '$doneCount/$kitTotal',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: p > 0
                                          ? kit.color
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: LinearProgressIndicator(
                                  value: p,
                                  backgroundColor:
                                      kit.color.withValues(alpha: 0.1),
                                  valueColor: AlwaysStoppedAnimation(kit.color),
                                  minHeight: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: startupKits.length,
              ),
            ),
          ),
          // Reset button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 48),
              child: OutlinedButton.icon(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text(
                        'Reset Progress?',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      content: const Text(
                        'This will erase all your lesson progress and restart onboarding. This cannot be undone.',
                        style:
                            TextStyle(color: AppColors.textSecondary, height: 1.5),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel')),
                        TextButton(
                          onPressed: () {
                            provider.reset();
                            Get.offAllNamed(Routes.onboarding);
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(color: AppColors.accent),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon:
                    const Icon(Icons.refresh_rounded, color: AppColors.accent, size: 18),
                label: const Text(
                  'Reset All Progress',
                  style: TextStyle(color: AppColors.accent),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.accent, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      );
    });
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;

  const _StatBox({
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 3),
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
