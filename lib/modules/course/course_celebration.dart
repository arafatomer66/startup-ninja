import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/course_model.dart';
import '../../data/providers/course_progress_provider.dart';
import '../../widgets/motion.dart';

/// Full-screen confetti moment when a toggle completes a whole week.
void celebrateWeek(CourseWeek week) {
  Get.dialog(
    _WeekCelebration(week: week),
    barrierColor: Colors.black.withValues(alpha: 0.55),
    barrierDismissible: true,
  );
}

/// Small floating "+XP" pill for single-item completions.
void celebrateXp(int xp, {String label = 'Nice — keep the streak going!'}) {
  Get.rawSnackbar(
    messageText: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
        const SizedBox(width: 6),
        Text(
          '+$xp XP',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: AppColors.success,
    borderRadius: 40,
    margin: const EdgeInsets.only(left: 40, right: 40, bottom: 24),
    maxWidth: 420,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    duration: const Duration(milliseconds: 1800),
    animationDuration: const Duration(milliseconds: 350),
    snackPosition: SnackPosition.BOTTOM,
  );
}

class _WeekCelebration extends StatefulWidget {
  final CourseWeek week;

  const _WeekCelebration({required this.week});

  @override
  State<_WeekCelebration> createState() => _WeekCelebrationState();
}

class _WeekCelebrationState extends State<_WeekCelebration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _confetti = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..forward();

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final xpEarned = widget.week.lessons.length *
            CourseProgressProvider.lessonXp +
        CourseProgressProvider.workshopXp +
        CourseProgressProvider.assignmentXp;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _confetti,
              builder: (context, _) => CustomPaint(
                painter: _ConfettiPainter(progress: _confetti.value),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: PopIn(
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 380),
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.xxl),
                  boxShadow: AppShadows.lg,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopIn(
                      duration: const Duration(milliseconds: 800),
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          gradient: AppGradients.forKit(AppColors.warning),
                          shape: BoxShape.circle,
                          boxShadow: AppShadows.glow(AppColors.warning),
                        ),
                        child: const Icon(Icons.emoji_events_rounded,
                            color: Colors.white, size: 44),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'WEEK ${widget.week.number} COMPLETE',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.6,
                        color: AppColors.warning,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.week.milestone,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.45,
                        letterSpacing: -0.2,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.bolt_rounded,
                              color: AppColors.success, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '$xpEarned XP earned this week',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppColors.success,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: Get.back,
                        child: const Text('Keep building →'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  final double progress;

  static final _particles = List.generate(90, (i) {
    final rng = Random(i * 7 + 3);
    return (
      x: rng.nextDouble(),
      speed: 0.5 + rng.nextDouble() * 0.8,
      drift: (rng.nextDouble() - 0.5) * 0.35,
      size: 5.0 + rng.nextDouble() * 6.0,
      spin: rng.nextDouble() * 6.283,
      color: i % 5,
    );
  });

  static const _colors = [
    AppColors.primary,
    AppColors.accent,
    AppColors.success,
    AppColors.warning,
    AppColors.info,
  ];

  const _ConfettiPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final p in _particles) {
      // Fall from above the screen; fade out at the tail of the animation.
      final t = (progress * p.speed * 1.6).clamp(0.0, 1.6);
      final y = -60 + t * (size.height + 120);
      if (y > size.height + 20) continue;
      final x = size.width * (p.x + p.drift * t);
      final opacity = progress > 0.75 ? (1 - (progress - 0.75) / 0.25) : 1.0;
      paint.color =
          _colors[p.color].withValues(alpha: opacity.clamp(0.0, 1.0));
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.spin + t * 5);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset.zero, width: p.size, height: p.size * 0.6),
          const Radius.circular(2),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.progress != progress;
}
