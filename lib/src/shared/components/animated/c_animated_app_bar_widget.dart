import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poke_app/src/shared/components/animated/c_animated_app_bar.dart';

class CAnimatedAppBarWidget extends StatefulWidget {
  final ScrollController scrollController;
  final List<Widget>? children;
  final double targetNumberToAnimate;
  final bool enableSafeArea;

  const CAnimatedAppBarWidget({
    Key? key,
    required this.scrollController,
    this.children,
    this.targetNumberToAnimate = 160,
    this.enableSafeArea = true,
  }) : super(key: key);

  @override
  State<CAnimatedAppBarWidget> createState() => _CAnimatedAppBarWidget();
}

class _CAnimatedAppBarWidget extends State<CAnimatedAppBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool showAppBar = false;

  void _addScrollListener() {
    widget.scrollController.addListener(() {
      setState(() =>
          showAppBar = widget.scrollController.position.pixels > widget.targetNumberToAnimate);
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _addScrollListener();
    return CAnimatedAppBar(
      animationController: _animationController,
      visible: widget.scrollController.position.pixels > widget.targetNumberToAnimate || showAppBar,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            margin: EdgeInsets.only(top: widget.enableSafeArea ? 0 : 30),
            child: SafeArea(
              top: widget.enableSafeArea,
              bottom: widget.enableSafeArea,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.children ?? [Container()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
