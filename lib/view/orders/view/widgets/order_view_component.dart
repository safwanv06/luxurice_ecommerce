import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/view/orders/service/model/model.dart';

class OrderViewComponent extends StatelessWidget {
  const OrderViewComponent({super.key, required this.orderDetails});

  final OrderedItemModel orderDetails;

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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order placed",
                  style: textStyles.font16Black,
                ),
                const Spacer(),
                Text(
                  "Total amount : INR ${orderDetails.totalAmount}",
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.font14Grey,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "Items",
                  style: textStyles.font14Grey,
                ),
                Text(
                  orderDetails.orderedProducts.length.toString(),
                  style: textStyles.font20Black,
                ),
              ],
            ),
            SizedBox(
              width: sizeChart.padding_8.w,
            )
          ],
        ),
      ),
    );
  }
}
