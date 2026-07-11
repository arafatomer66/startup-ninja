import 'package:flutter/material.dart';

class LessonBlock {
  final String heading;
  final String body;

  const LessonBlock({required this.heading, required this.body});
}

class CourseLesson {
  final String title;
  final String description;
  final List<LessonBlock> blocks;

  const CourseLesson({
    required this.title,
    required this.description,
    this.blocks = const [],
  });
}

class CourseResource {
  final String title;
  final String source;
  final String url;

  const CourseResource({
    required this.title,
    required this.source,
    required this.url,
  });
}

class CourseBook {
  final String title;
  final String author;
  final String why;
  final String url;

  const CourseBook({
    required this.title,
    required this.author,
    required this.why,
    required this.url,
  });
}

class CourseWeek {
  final String id;
  final int number;
  final String title;
  final String goal;
  final List<CourseLesson> lessons;
  final String workshop;
  final String assignment;
  final String milestone;
  final List<CourseResource> resources;

  const CourseWeek({
    required this.id,
    required this.number,
    required this.title,
    required this.goal,
    required this.lessons,
    required this.workshop,
    required this.assignment,
    required this.milestone,
    this.resources = const [],
  });
}

class CourseTier {
  final String id;
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final List<CourseWeek> weeks;

  const CourseTier({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.weeks,
  });
}
