import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';

import '../custom_app_bar/custom_app_bar.dart';


class HeroImageView extends StatelessWidget {
  const HeroImageView(
      {super.key,
        required this.tag,
        required this.imageUrl,
        required this.imageName,
        this.isFileImage,
        this.fileImage});

  final String tag;
  final String imageUrl;
  final String imageName;
  final bool? isFileImage;
  final File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: imageName.split("/").last,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(sizeChart.padding_24.sp),
        child: Center(
            child: Hero(
                tag: tag,
                child: isFileImage == true
                    ? Image.file(fileImage!)
                    : Image.network(imageUrl,errorBuilder: (context, error, stackTrace) {
                  return Image.asset(imageData.noImageView);
                },))),
      ),
    );
  }
}
