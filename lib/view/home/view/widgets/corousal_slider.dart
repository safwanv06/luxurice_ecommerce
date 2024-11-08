import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';

import '../../service/model/model.dart';

class CorousalSlider extends StatelessWidget {
  const CorousalSlider({super.key, required this.products});

  final List<ProductData> products;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: screenUtil.screenHeight / 4,autoPlay: true),
      items: products.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                padding: EdgeInsets.all(sizeChart.padding_12.sp),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: i.image != null
                          ? NetworkImage(i.image!)
                          : AssetImage(imageData.noImageView),
                    ),
                    borderRadius: BorderRadius.circular(sizeChart.radius8),
                    border: Border.all(
                        width: 1, color: colorsData.grey.withOpacity(0.3))),
                child: Text(
                  i.name,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.font14Grey,
                ));
          },
        );
      }).toList(),
    );
  }
}
