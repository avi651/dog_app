import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.black87,
        period: Duration(milliseconds: 1500),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.red[200],
            shape: shapeBorder,
          ),
        ),
      );
}
