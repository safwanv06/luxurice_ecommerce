import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
        required this.title,
        required this.onBackPressed,
        this.elevation,
        this.trailingWidget,
        this.noBackButton});

  final String title;
  final bool? noBackButton;
  final double? elevation;
  final Widget? trailingWidget;
  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorsData.white,
      automaticallyImplyLeading: false,
      surfaceTintColor: colorsData.white,
      elevation: elevation ?? 0,
      leading: noBackButton != true
          ? Padding(
        padding: EdgeInsets.only(
            left: sizeChart.padding_12.sp,
            top: sizeChart.padding_24.sp),
        child: InkWell(
            splashColor: Colors.transparent,
            onTap: onBackPressed,
            child: Icon(
              Icons.arrow_back,
              color: colorsData.black,
              size: sizeChart.fontSize24,
            )),
      )
          : null,
      title: Padding(
        padding: EdgeInsets.only(top: sizeChart.padding_24.sp),
        child: Text(title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
                color: colorsData.black,
                fontSize: sizeChart.fontSize20.sp,
                fontWeight: sizeChart.medium,
                )),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
              top: sizeChart.padding_24.sp, right: sizeChart.padding_24.h),
          child: trailingWidget ?? const SizedBox(),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
