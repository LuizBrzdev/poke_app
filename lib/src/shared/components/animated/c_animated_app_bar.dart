// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CAnimatedAppBar extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;
  final bool visible;
  final double height;

  const CAnimatedAppBar({
    super.key,
    required this.child,
    required this.animationController,
    required this.visible,
    this.height = 98,
  });

  @override
  State<CAnimatedAppBar> createState() => _CAnimatedAppBarState();
}

class _CAnimatedAppBarState extends State<CAnimatedAppBar> {
  bool visibleAppBar = false;

  @override
  void initState() {
    _showAppBarOnlyAfter1Second();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _adjustControllerAnimation();
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
        CurvedAnimation(parent: widget.animationController, curve: Curves.fastOutSlowIn),
      ),
      child: Visibility(
        visible: visibleAppBar,
        child: SizedBox(
          height: widget.height,
          child: widget.child,
        ),
      ),
    );
  }

  void _adjustControllerAnimation() {
    widget.visible ? widget.animationController.reverse() : widget.animationController.forward();
  }

  Future<void> _showAppBarOnlyAfter1Second() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      visibleAppBar = true;
    });
  }
}
