import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../../data/services/blueprint_aggregator.dart';

/// Investor Pitch mode — same data, condensed to a 1-page deck-style layout.
class PitchView extends StatelessWidget {
  final Blueprint blueprint;
  const PitchView({super.key, required this.blueprint});

  String _fmtRev(double v) {
    if (v == 0) return '—';
    if (v >= 10000000) return '৳${(v / 10000000).toStringAsFixed(1)} Cr';
    if (v >= 100000) return '৳${(v / 100000).toStringAsFixed(0)} L';
    return '৳${v.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    final p = blueprint.pitch;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PitchSection(
            n: 1,
            label: 'PROBLEM',
            color: AppColors.accent,
            content: p.problem ?? 'Articulate the customer pain in one paragraph.',
            empty: p.problem == null,
          ),
          _PitchSection(
            n: 2,
            label: 'SOLUTION',
            color: AppColors.kitProduct,
            content: p.solution ?? 'Describe how your product solves the problem.',
            empty: p.solution == null,
          ),
          _PitchSection(
            n: 3,
            label: 'MARKET',
            color: AppColors.kitBusiness,
            content: p.market != null
                ? 'Primary target industry: **${p.market}**'
                : 'No target industry prioritized yet.',
            empty: p.market == null,
          ),
          _PitchSection(
            n: 4,
            label: 'WHY US',
            color: AppColors.primary,
            content: p.whyUs ?? 'What makes your team / approach defensible.',
            empty: p.whyUs == null,
          ),
          _MetricsCard(p: p, fmt: _fmtRev),
          _PitchSection(
            n: 5,
            label: 'PROOF',
            color: AppColors.kitFinance,
            content: p.proof ?? 'Case studies, traction metrics, customer quotes.',
            empty: p.proof == null,
          ),
          _PitchSection(
            n: 6,
            label: 'THE ASK',
            color: AppColors.kitSOP,
            content: p.ask ?? 'How much you\'re raising and what it unlocks.',
            empty: p.ask == null,
          ),
        ],
      ),
    );
  }
}

class _PitchSection extends StatelessWidget {
  final int n;
  final String label;
  final Color color;
  final String content;
  final bool empty;
  const _PitchSection({
    required this.n,
    required this.label,
    required this.color,
    required this.content,
    required this.empty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: empty
              ? AppColors.border
              : color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$n',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  color: color,
                ),
              ),
              if (empty) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'TODO',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: AppColors.warning,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          _RichBoldText(
            text: content,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: empty
                  ? AppColors.textHint
                  : AppColors.textPrimary,
              fontStyle: empty ? FontStyle.italic : FontStyle.normal,
            ),
            boldColor: color,
          ),
        ],
      ),
    );
  }
}

class _MetricsCard extends StatelessWidget {
  final InvestorPitch p;
  final String Function(double) fmt;
  const _MetricsCard({required this.p, required this.fmt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppGradients.hero,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TRACTION & PROJECTIONS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _M(label: 'TEAM', value: '${p.teamCount}'),
              _M(label: 'LEADS', value: '${p.customerCount}'),
              _M(label: 'Y1 REV', value: fmt(p.y1Revenue)),
              _M(label: 'Y3 REV', value: fmt(p.y3Revenue)),
            ],
          ),
        ],
      ),
    );
  }
}

class _M extends StatelessWidget {
  final String label;
  final String value;
  const _M({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _RichBoldText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color boldColor;
  const _RichBoldText({
    required this.text,
    required this.style,
    required this.boldColor,
  });

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    int lastEnd = 0;
    for (final m in regex.allMatches(text)) {
      if (m.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, m.start), style: style));
      }
      spans.add(TextSpan(
        text: m.group(1),
        style: style.copyWith(
            fontWeight: FontWeight.w800, color: boldColor),
      ));
      lastEnd = m.end;
    }
    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd), style: style));
    }
    return RichText(text: TextSpan(children: spans));
  }
}
