import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/course_model.dart';

/// One-shot milestone toast shown when a toggle completes a whole week.
void celebrateWeek(CourseWeek week) {
  Get.snackbar(
    '🏆  Week ${week.number} milestone unlocked!',
    week.milestone,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(16),
    borderRadius: AppRadius.lg,
    backgroundColor: AppColors.success,
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    icon: const Icon(Icons.emoji_events_rounded, color: Colors.white),
    shouldIconPulse: true,
  );
}
