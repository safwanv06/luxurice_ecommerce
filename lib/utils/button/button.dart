import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.buttonColor,
      required this.buttonName,
      required this.onTap});

  final Color? buttonColor;
  final String buttonName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor ?? colorsData.primaryBrown,
            borderRadius: BorderRadius.circular(28.r)),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        child: Center(
          child: Text(
            buttonName,
            style: textStyles.buttonFont16,
          ),
        ),
      ),
    );
  }
}
