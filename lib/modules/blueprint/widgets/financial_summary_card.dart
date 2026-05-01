import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../../data/services/blueprint_aggregator.dart';

class FinancialSummaryCard extends StatelessWidget {
  final FinancialSummary finance;
  const FinancialSummaryCard({super.key, required this.finance});

  String _fmt(double v) {
    final neg = v < 0;
    final n = v.abs();
    String s;
    if (n >= 10000000) {
      s = '${(n / 10000000).toStringAsFixed(2)} Cr';
    } else if (n >= 100000) {
      s = '${(n / 100000).toStringAsFixed(1)} L';
    } else if (n >= 1000) {
      s = '${(n / 1000).toStringAsFixed(1)}K';
    } else {
      s = n.toStringAsFixed(0);
    }
    return '${neg ? "-" : ""}৳$s';
  }

  @override
  Widget build(BuildContext context) {
    final empty = finance.y1Revenue == 0 && finance.y1Opex == 0;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.kitFinance,
            Color.lerp(AppColors.kitFinance, Colors.white, 0.25)!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance_rounded,
                  color: Colors.white, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Year 1 Financials',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (empty) ...[
            Text(
              'No financial data yet — open the Finance Kit and enter your monthly P&L.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.92),
                height: 1.4,
              ),
            ),
          ] else ...[
            Row(
              children: [
                _Stat(label: 'Revenue', value: _fmt(finance.y1Revenue)),
                _Stat(label: 'OPEX', value: _fmt(finance.y1Opex)),
                _Stat(
                  label: 'Net Profit',
                  value: _fmt(finance.y1NetProfit),
                  positive: finance.isProfitable,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _Stat(label: 'Team', value: '${finance.teamCount} hires'),
                _Stat(label: 'CAPEX', value: _fmt(finance.totalCapex)),
                _Stat(label: 'Leads', value: '${finance.leadsScored}'),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final bool? positive;
  const _Stat({required this.label, required this.value, this.positive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (positive == true)
                  const Icon(Icons.trending_up_rounded,
                      color: Colors.white, size: 14)
                else if (positive == false)
                  const Icon(Icons.trending_down_rounded,
                      color: Colors.white, size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
