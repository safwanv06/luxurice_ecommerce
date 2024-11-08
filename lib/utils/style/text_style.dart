import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  TextStyle font32Black = GoogleFonts.inter(
      color: colorsData.black, fontWeight: sizeChart.large, fontSize: sizeChart.fontSize32);
  TextStyle font16Black = GoogleFonts.inter(
      color: colorsData.black, fontWeight: sizeChart.small, fontSize: sizeChart.fontSize16);
  TextStyle font20Black = GoogleFonts.inter(
      color: colorsData.black, fontWeight: sizeChart.medium, fontSize: sizeChart.fontSize20);
  TextStyle buttonFont16 = GoogleFonts.inter(
      color: colorsData.white, fontWeight: sizeChart.small, fontSize: sizeChart.fontSize16);
  TextStyle font14Black = GoogleFonts.inter(
      color: colorsData.black, fontWeight: sizeChart.small, fontSize: sizeChart.fontSize14);
TextStyle font16Brown = GoogleFonts.inter(
      color: colorsData.primaryBrown, fontWeight: sizeChart.small, fontSize: sizeChart.fontSize14);
TextStyle font14Grey = GoogleFonts.inter(
      color: colorsData.grey, fontWeight: sizeChart.medium, fontSize: sizeChart.fontSize14);
}
