import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/courses/startup_101.dart';
import '../../data/courses/startup_101/bookshelf.dart';
import '../../data/models/kit_model.dart';
import '../../widgets/responsive.dart';

/// Global search across everything in the app: course lessons and weeks,
/// interactive trackers, kit lessons, books, and resource links.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchItem {
  final String title;
  final String subtitle;
  final String group;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  _SearchItem({
    required this.title,
    required this.subtitle,
    required this.group,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  String get haystack => '$title $subtitle'.toLowerCase();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  late final List<_SearchItem> _index;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _index = _buildIndex();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<_SearchItem> _buildIndex() {
    final items = <_SearchItem>[];

    for (final week in allCourseWeeks) {
      final tier = tierForWeek(week);
      items.add(_SearchItem(
        title: 'Week ${week.number} — ${week.title}',
        subtitle: week.goal,
        group: 'Course weeks',
        icon: Icons.flag_rounded,
        color: tier.color,
        onTap: () => Get.toNamed(Routes.courseWeek, arguments: week),
      ));
      for (var i = 0; i < week.lessons.length; i++) {
        final lesson = week.lessons[i];
        items.add(_SearchItem(
          title: 'Lesson ${week.number}.${i + 1} — ${lesson.title}',
          subtitle: lesson.description,
          group: 'Lessons',
          icon: Icons.menu_book_rounded,
          color: tier.color,
          onTap: () => Get.toNamed(Routes.courseLesson,
              arguments: {'week': week, 'index': i}),
        ));
      }
      for (final r in week.resources) {
        items.add(_SearchItem(
          title: r.title,
          subtitle: '${r.source} · Week ${week.number} resource',
          group: 'Resources',
          icon: Icons.link_rounded,
          color: tier.color,
          onTap: () => launchUrl(Uri.parse(r.url),
              mode: LaunchMode.externalApplication),
        ));
      }
    }

    for (final kit in startupKits) {
      for (final section in kit.sections) {
        items.add(_SearchItem(
          title: section.title,
          subtitle: '${kit.title} tracker',
          group: 'Trackers',
          icon: Icons.grid_view_rounded,
          color: kit.color,
          onTap: () => Get.toNamed(Routes.section,
              arguments: {'kit': kit, 'section': section}),
        ));
      }
      for (final lesson in kit.lessons) {
        items.add(_SearchItem(
          title: lesson.title,
          subtitle: '${kit.title} lesson',
          group: 'Kit lessons',
          icon: Icons.article_rounded,
          color: kit.color,
          onTap: () => Get.toNamed(Routes.moduleDetail, arguments: kit),
        ));
      }
    }

    for (final book in startup101Books) {
      items.add(_SearchItem(
        title: book.title,
        subtitle: '${book.author} — ${book.why}',
        group: 'Books',
        icon: Icons.auto_stories_rounded,
        color: AppColors.accent,
        onTap: () => launchUrl(Uri.parse(book.url),
            mode: LaunchMode.externalApplication),
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase();
    final terms = query.split(RegExp(r'\s+')).where((t) => t.isNotEmpty);
    final results = query.isEmpty
        ? <_SearchItem>[]
        : _index
            .where((e) => terms.every((t) => e.haystack.contains(t)))
            .take(40)
            .toList();

    final grouped = <String, List<_SearchItem>>{};
    for (final r in results) {
      grouped.putIfAbsent(r.group, () => []).add(r);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          onChanged: (v) => setState(() => _query = v),
          decoration: const InputDecoration(
            hintText: 'Search lessons, trackers, books…',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: false,
            isDense: true,
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          if (_query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: () {
                _controller.clear();
                setState(() => _query = '');
              },
            ),
        ],
      ),
      body: ResponsiveContent(
        child: query.isEmpty
            ? const _SearchHint()
            : results.isEmpty
                ? const _NoResults()
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                    children: [
                      for (final entry in grouped.entries) ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                          child: Text(
                            entry.key.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.0,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        for (final item in entry.value)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppSpacing.sm),
                            child: _ResultTile(item: item),
                          ),
                      ],
                    ],
                  ),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  final _SearchItem item;

  const _ResultTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      hoverShadowColor: item.color,
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
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(item.icon, color: item.color, size: 17),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
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
          ],
        ),
      ),
    );
  }
}

class _SearchHint extends StatelessWidget {
  const _SearchHint();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppRadius.xl),
            ),
            child: const Icon(Icons.search_rounded,
                color: AppColors.primary, size: 34),
          ),
          const SizedBox(height: 18),
          const Text(
            'Search everything',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              '68 course lessons, 75 trackers, books and resources — try "pricing", "equity", or "interview".',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No matches — try a shorter keyword.',
        style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
      ),
    );
  }
}
