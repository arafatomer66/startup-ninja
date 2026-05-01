import 'package:flutter/material.dart';

/// Industry-standard responsive breakpoints (Material You / Tailwind-aligned).
///
/// xs: phone           (< 480)
/// sm: large phone     (480 – 759)
/// md: tablet          (760 – 1023)
/// lg: small desktop   (1024 – 1439)
/// xl: desktop         (>= 1440)
class Breakpoints {
  static const xs = 480.0;
  static const sm = 760.0;
  static const md = 1024.0;
  static const lg = 1440.0;

  static bool isMobile(BuildContext c) => MediaQuery.sizeOf(c).width < sm;
  static bool isTablet(BuildContext c) {
    final w = MediaQuery.sizeOf(c).width;
    return w >= sm && w < md;
  }

  static bool isDesktop(BuildContext c) => MediaQuery.sizeOf(c).width >= md;
  static bool isWide(BuildContext c) => MediaQuery.sizeOf(c).width >= lg;

  /// Number of columns to use for grid-style content.
  static int gridColumns(BuildContext c) {
    final w = MediaQuery.sizeOf(c).width;
    if (w >= lg) return 4;
    if (w >= md) return 3;
    if (w >= sm) return 2;
    return 1;
  }
}

/// Wraps content in a centered, max-width container so it doesn't stretch
/// edge-to-edge on wide screens. Pass `wide: true` for screens that benefit
/// from more horizontal real estate (Blueprint, Modules grid).
class ResponsiveContent extends StatelessWidget {
  final Widget child;
  final bool wide;
  final EdgeInsetsGeometry? padding;
  const ResponsiveContent({
    super.key,
    required this.child,
    this.wide = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = wide ? 1180.0 : 720.0;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padding == null ? child : Padding(padding: padding!, child: child),
      ),
    );
  }
}

/// Builds a CustomScrollView body that constrains its slivers to a max width
/// on desktop. Use as the outer scaffold body for Home, Profile, Modules etc.
class ResponsiveSliverBody extends StatelessWidget {
  final List<Widget> slivers;
  final bool wide;
  const ResponsiveSliverBody({
    super.key,
    required this.slivers,
    this.wide = false,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = wide ? 1180.0 : 720.0;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: CustomScrollView(slivers: slivers),
      ),
    );
  }
}

/// MouseRegion + AnimatedScale + AnimatedContainer combo for premium hover/press
/// feedback. Wraps any tap target.
class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final double hoverElevation;
  final double pressedScale;
  final Color? hoverShadowColor;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.hoverElevation = 12,
    this.pressedScale = 0.98,
    this.hoverShadowColor,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final shadow = widget.hoverShadowColor ?? Colors.black;
    return MouseRegion(
      cursor: widget.onTap == null
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() {
        _hover = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _pressed ? widget.pressedScale : 1.0,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              boxShadow: _hover
                  ? [
                      BoxShadow(
                        color: shadow.withValues(alpha: 0.10),
                        blurRadius: widget.hoverElevation * 1.5,
                        offset: Offset(0, widget.hoverElevation * 0.5),
                      ),
                    ]
                  : [],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
