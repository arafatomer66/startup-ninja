import 'package:flutter/material.dart';

/// One-shot entrance: fade + slide up. Give list items a staggered `delay`
/// (index * ~40ms) for the Duolingo-style cascade.
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offset;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 380),
    this.offset = 18,
  });

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration);
  late final CurvedAnimation _curve =
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      builder: (context, child) => Opacity(
        opacity: _curve.value,
        child: Transform.translate(
          offset: Offset(0, (1 - _curve.value) * widget.offset),
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}

/// Elastic scale-in for badges, trophies and reward chips.
class PopIn extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const PopIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 550),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.4, end: 1.0),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: child,
    );
  }
}

/// Checkbox that pops with an elastic bounce when it flips to done.
/// Replaces the static 26px check squares across the course screens.
class BouncyCheck extends StatelessWidget {
  final bool done;
  final Color color;
  final double size;

  const BouncyCheck({
    super.key,
    required this.done,
    required this.color,
    this.size = 26,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: ValueKey(done),
      tween: Tween(begin: done ? 0.5 : 1.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.elasticOut,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: done ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(size * 0.3),
          border: Border.all(
            color: done ? color : const Color(0xFFB0ABCC),
            width: 2,
          ),
        ),
        child: done
            ? Icon(Icons.check_rounded, color: Colors.white, size: size * 0.65)
            : null,
      ),
    );
  }
}
