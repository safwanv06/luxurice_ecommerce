import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  ShimmerEffect.rectange({super.key,
    required this.width,
    required this.height,
  }) : shapeDecoration = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r)));

  ShimmerEffect.circle(
      {super.key, required this.width,
        required this.height,
        required this.shapeDecoration});

  double width;
  double height;
  ShapeBorder shapeDecoration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[350]!,
        child: Container(
          width: width,
          height: height,
          decoration:
          ShapeDecoration(color: Colors.grey[400], shape: shapeDecoration),
        ));
  }
}
