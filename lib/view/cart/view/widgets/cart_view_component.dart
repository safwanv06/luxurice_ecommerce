import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/image_view_component/image_view.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';

class CartViewComponent extends StatelessWidget {
  const CartViewComponent({super.key, required this.productDetails});

  final ProductData productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sizeChart.padding_16.sp),
      child: Container(
        height: 80.h,
        padding: EdgeInsets.all(sizeChart.padding_12.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeChart.radius8),
            border:
                Border.all(width: 1, color: colorsData.grey.withOpacity(0.3))),
        child: Row(
          children: [
            CustomSquareImage(
              imageType: ImageType.network,
              imageUrl: productDetails.image,
            ),
            SizedBox(
              width: sizeChart.padding_8.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDetails.name,
                  style: textStyles.font16Black,
                ),
                const Spacer(),
                Text(
                  "INR ${productDetails.price}",
                  style: textStyles.font14Grey,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text("Quantity",style: textStyles.font14Grey,),
                Text(productDetails.quantity.toString(),style: textStyles.font20Black,),
              ],
            ),
            SizedBox(width: sizeChart.padding_8.w,)
          ],
        ),
      ),
    );
  }
}
