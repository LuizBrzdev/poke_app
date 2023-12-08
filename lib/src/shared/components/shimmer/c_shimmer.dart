import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BoxDecoration? decoration;

  const CShimmer({
    Key? key,
    this.width = double.infinity,
    this.height = 50,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(243, 244, 246, 1),
      highlightColor: Colors.white,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
