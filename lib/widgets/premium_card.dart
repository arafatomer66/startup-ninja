import 'package:flutter/material.dart';
import '../app/theme.dart';

class PremiumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double radius;
  final bool hasShadow;
  final VoidCallback? onTap;

  const PremiumCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.radius = 20,
    this.hasShadow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      padding: padding ?? const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color ?? AppColors.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.border),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: card);
    }
    return card;
  }
}

class GradientBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const GradientBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
