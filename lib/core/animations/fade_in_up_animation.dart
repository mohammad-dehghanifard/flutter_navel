import 'package:flutter/material.dart';

class FadeInUpAnimation extends StatefulWidget {
  const FadeInUpAnimation({super.key, required this.duration, required this.child, required this.childOffset});

  final Duration duration;
  final Widget child;
  final Offset childOffset;

  @override
  State<FadeInUpAnimation> createState() => _FadeInUpAnimationState();
}

class _FadeInUpAnimationState extends State<FadeInUpAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _childMoveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: widget.duration);
    _opacityAnimation = Tween<double>(begin: 0.0 ,end: 1.0 ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _childMoveAnimation = Tween<Offset>(begin: Offset(widget.childOffset.dx, widget.childOffset.dy / 100),end: Offset.zero ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FadeTransition(
          opacity: _opacityAnimation,
          child: SlideTransition(
              position: _childMoveAnimation,
              child: widget.child,
          ),
      ),
    );
  }
}
