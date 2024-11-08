import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(bottom: sizeChart.padding_8.h),
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: colorsData.grey,
                size: sizeChart.padding_24.sp,
              ),
              SizedBox(
                width: sizeChart.padding_24.w,
              ),
              Text(
                title,
                style: textStyles.font20Black,
              ),
            ],
          ),
        ));
  }
}
