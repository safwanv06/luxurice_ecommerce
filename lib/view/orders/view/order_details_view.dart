import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/utils/custom_app_bar/custom_app_bar.dart';
import 'package:globsoft_ecommerce_application/view/cart/view/widgets/cart_view_component.dart';
import 'package:globsoft_ecommerce_application/view/orders/view/widgets/order_view_component.dart';

import '../../../main.dart';
import '../../home/service/model/model.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView(
      {super.key,
      required this.orderedItems,
      required this.address,
      required this.totalAmount});

  final String address;
  final String totalAmount;
  final List<ProductData> orderedItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order Details",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: orderedItems.length,
            itemBuilder: (context, index) {
              return CartViewComponent(productDetails: orderedItems[index]);
            },
          ),
          Padding(
            padding: EdgeInsets.all(sizeChart.padding_16.sp),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(sizeChart.padding_12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeChart.radius8),
                  border: Border.all(
                      width: 1, color: colorsData.grey.withOpacity(0.3))),
              child: Column(
                children: [
                  Text(
                    "Ordered Address",
                    style: textStyles.font20Black,
                  ),
                  SizedBox(
                    height: sizeChart.padding_16.h,
                  ),
                  Text(
                    address,
                    style: textStyles.font14Black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(sizeChart.padding_16.sp),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(sizeChart.padding_12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeChart.radius8),
                  border: Border.all(
                      width: 1, color: colorsData.grey.withOpacity(0.3))),
              child: Row(
                children: [
                  Text(
                    "Total Amount",
                    style: textStyles.font20Black,
                  ),
                  Spacer(),
                  Text(
                    totalAmount,
                    style: textStyles.font14Black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
