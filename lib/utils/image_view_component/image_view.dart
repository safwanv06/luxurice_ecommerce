import 'dart:io';

import 'package:flutter/material.dart';

import '../../main.dart';
import 'hero_image.dart';

class CustomSquareImage extends StatelessWidget {
  const CustomSquareImage(
      {super.key,
      required this.imageType,
      this.imageName,
      this.imageUrl,
      this.tag,
      this.width,
      this.boxFit,
      this.color,
      this.disableExpandedView,
      this.height,
      this.svgBackground});

  final ImageType imageType;
  final String? imageName;
  final String? imageUrl;
  final String? tag;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? boxFit;
  final bool? disableExpandedView;
  final Color? svgBackground;

  @override
  Widget build(BuildContext context) {
    String myId = tag ?? DateTime.now().toString();
    return InkWell(
      onTap: disableExpandedView == true
          ? null
          : () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeroImageView(
                      tag: myId,
                      imageUrl: imageUrl ?? "",
                      imageName: imageName ?? imageUrl?.split("/").last ?? "",
                      fileImage: imageType == ImageType.file
                          ? File(imageUrl ?? "")
                          : null,
                      isFileImage: imageType == ImageType.file,
                    ),
                  ));
            },
      child: Hero(
        tag: myId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(sizeChart.radius8),
          child: imageType == ImageType.file
              ? Image.file(
                  width: width,
                  height: width,
                  fit: BoxFit.fill,
                  File(imageUrl ?? ""),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      width: width,
                      height: width,
                      imageData.noImageView,
                      fit: boxFit ?? BoxFit.fill,
                    );
                  },
                )
              : imageType == ImageType.network
                  ? Image.network(
                      width: width,
                      height: height,
                      fit: BoxFit.fill,
                      imageUrl ?? "",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          height: height,
                          width: width,
                          imageData.noImageView,
                          fit: BoxFit.fill,
                        );
                      },
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}

enum ImageType { network, file, asset }
