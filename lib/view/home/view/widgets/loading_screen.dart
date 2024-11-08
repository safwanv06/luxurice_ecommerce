import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';

import '../../../../utils/shimmer/shimmer.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(sizeChart.padding_8.sp),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index) {
          return Padding(
            padding:
            EdgeInsets.only(bottom: sizeChart.padding_16.h),
            child: Container(
              padding: EdgeInsets.all(sizeChart.padding_8.sp),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(sizeChart.radius8),
                border: Border.all(
                    width: 0.5.sp,
                    color: colorsData.grey.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: ShimmerEffect.rectange(width: double.infinity, height: 80.h)),
                  SizedBox(
                    height: sizeChart.padding_4.w,
                  ),
                  Expanded(
                    flex: 2,
                      child: ShimmerEffect.rectange(
                          width: double.infinity, height: 20.h)),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
