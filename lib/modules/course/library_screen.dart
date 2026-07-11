import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/theme.dart';
import '../../data/courses/startup_101.dart';
import '../../data/courses/startup_101/bookshelf.dart';
import '../../widgets/responsive.dart';

/// Every learning resource in one place: the Founder's Bookshelf plus
/// each week's curated links, grouped by week.
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weeksWithResources =
        allCourseWeeks.where((w) => w.resources.isNotEmpty).toList();
    final totalLinks = weeksWithResources.fold<int>(
            0, (s, w) => s + w.resources.length) +
        startup101Books.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveSliverBody(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppGradients.hero,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 8, 22, 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: Get.back,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.arrow_back_rounded,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.xs),
                            ),
                            child: const Text(
                              'LIBRARY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Learning Library',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$totalLinks curated books, guides and essays — every resource from the course in one place.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                children: [
                  const Icon(Icons.auto_stories_rounded,
                      color: AppColors.accent, size: 20),
                  const SizedBox(width: 8),
                  Text("The Founder's Bookshelf",
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: _LinkTile(
                    title: startup101Books[i].title,
                    subtitle:
                        '${startup101Books[i].author} — ${startup101Books[i].why}',
                    icon: Icons.menu_book_rounded,
                    color: AppColors.accent,
                    url: startup101Books[i].url,
                  ),
                ),
                childCount: startup101Books.length,
              ),
            ),
          ),
          for (final week in weeksWithResources) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: tierForWeek(week)
                            .color
                            .withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                      ),
                      child: Text(
                        'WEEK ${week.number}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                          color: tierForWeek(week).color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        week.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.2,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _LinkTile(
                      title: week.resources[i].title,
                      subtitle: week.resources[i].source,
                      icon: _iconFor(week.resources[i].source),
                      color: tierForWeek(week).color,
                      url: week.resources[i].url,
                    ),
                  ),
                  childCount: week.resources.length,
                ),
              ),
            ),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 56)),
        ],
      ),
    );
  }

  static IconData _iconFor(String source) {
    final s = source.toLowerCase();
    if (s.contains('book')) return Icons.auto_stories_rounded;
    if (s.contains('video') || s.contains('course')) {
      return Icons.play_circle_fill_rounded;
    }
    if (s.contains('slide')) return Icons.slideshow_rounded;
    if (s.contains('template') || s.contains('tool')) {
      return Icons.handyman_rounded;
    }
    return Icons.article_rounded;
  }
}

class _LinkTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String url;

  const _LinkTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(AppRadius.md),
      hoverShadowColor: color,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11.5,
                      height: 1.4,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.open_in_new_rounded,
                size: 15, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}
