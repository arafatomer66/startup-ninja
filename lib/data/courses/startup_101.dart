import '../models/course_model.dart';
import 'startup_101/case_studies.dart';
import 'startup_101/tier0.dart';
import 'startup_101/tier1.dart';
import 'startup_101/tier2.dart';
import 'startup_101/tier3.dart';
import 'startup_101/tier4.dart';

/// Startup 101 — Zero to Founder. 16-week cohort curriculum (plus Week 0).
/// Content is data: each week and lesson renders through the course screens.
/// Week/lesson content lives in startup_101/tier0.dart … tier4.dart.
const courseTitle = 'Startup 101';
const courseTagline = 'Zero to Founder — a 16-week journey';
const courseDescription =
    'Everything you need to go from idea to a live pitch, one week at a time. '
    'Each week ends with a piece of your startup built: lessons, a live '
    'workshop, an assignment, and a milestone deliverable.';

const startup101Tiers = [tier0, tier1, tier2, tier3, tier4];

List<CourseWeek> get allCourseWeeks =>
    startup101Tiers.expand((t) => t.weeks).toList();

CourseTier tierForWeek(CourseWeek week) =>
    startup101Tiers.firstWhere((t) => t.weeks.contains(week));

/// Real-company story for the week, or null if none is defined.
CourseCaseStudy? caseStudyForWeek(CourseWeek week) =>
    courseCaseStudies[week.id];
