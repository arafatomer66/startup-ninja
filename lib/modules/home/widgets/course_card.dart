import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../app/theme.dart';
import '../../../data/courses/startup_101.dart';
import '../../../data/providers/course_progress_provider.dart';
import '../../../widgets/responsive.dart';
import '../../shell/shell_screen.dart';

/// Home entry point for the Startup 101 course. Gradient hero card with a
/// circular ring so the course reads as a first-class destination, not a kit.
class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Get.find<CourseProgressProvider>();
    final percent = provider.courseProgress;
    final current = provider.currentWeek;
    final started = provider.courseDoneCount > 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: HoverCard(
        onTap: () => Get.find<ShellController>().setTab(1),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        hoverShadowColor: AppColors.primary,
        hoverElevation: 18,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: AppGradients.hero,
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            boxShadow: AppShadows.glow(AppColors.primary),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                      ),
                      child: const Text(
                        'COURSE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      courseTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      courseTagline,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.play_circle_fill_rounded,
                            color: Colors.white, size: 18),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            started
                                ? 'Continue · Week ${current.number}: ${current.title}'
                                : 'Start with Week 0 · Onboarding',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              CircularPercentIndicator(
                radius: 42,
                lineWidth: 7,
                percent: percent,
                animation: true,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  '${(percent * 100).toInt()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                progressColor: Colors.white,
                backgroundColor: Colors.white.withValues(alpha: 0.22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
