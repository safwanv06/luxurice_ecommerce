import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/image_view_component/image_view.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';

import '../../../product_view/view/product_view.dart';

class HomeScreenComponent extends StatelessWidget {
  const HomeScreenComponent({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductView(productId: product.id),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(sizeChart.padding_12.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeChart.radius8),
              border: Border.all(
                  width: 1, color: colorsData.grey.withOpacity(0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                child: CustomSquareImage(
                  imageType: ImageType.network,
                  imageUrl: product.image,
                  width: double.infinity,
                ),
              )),
              SizedBox(
                height: sizeChart.padding_8.h,
              ),
              Text(
                product.name,
                style: textStyles.font16Black,
              ),
              SizedBox(
                height: sizeChart.padding_4.h,
              ),
              Text(
                "INR ${product.price}",
                style: textStyles.font14Grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
