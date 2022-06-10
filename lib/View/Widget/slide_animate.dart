import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlideAnimate extends StatefulWidget {
  Widget child;
  SlideAnimate({Key key, this.child}) : super(key: key);

  @override
  State<SlideAnimate> createState() => _SlideAnimateState();
}

class _SlideAnimateState extends State<SlideAnimate>
    with SingleTickerProviderStateMixin {
  AnimationController _openAnimationController;

  @override
  void initState() {
    _openAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _openAnimationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _openAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _openAnimationController,
      child: widget.child,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: _openAnimationController.value,
          duration: const Duration(milliseconds: 500),
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: _openAnimationController, curve: Curves.ease)),
            child: child,
          ),
        );
      }
    );
  }
}
