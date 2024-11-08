import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/button/button.dart';
import 'package:globsoft_ecommerce_application/utils/flushbar/flushbar.dart';
import 'package:globsoft_ecommerce_application/utils/image_view_component/image_view.dart';
import 'package:globsoft_ecommerce_application/utils/loading_screen/loading_screen.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';
import 'package:globsoft_ecommerce_application/view/product_view/controller/controller.dart';
import 'package:globsoft_ecommerce_application/view/product_view/service/service.dart';

class ProductViewComponent extends StatelessWidget {
  ProductViewComponent({super.key, required this.productDetails});

  ProductData productDetails;

  Widget sizedBox12 = SizedBox(
    height: sizeChart.padding_12.h,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      int quantity = ref.watch(quantityProviderState);
      return SizedBox(
        height: screenUtil.screenHeight,
        width: screenUtil.screenWidth,
        child: Padding(
          padding: EdgeInsets.all(sizeChart.fontSize16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenUtil.screenWidth / 5),
                        child: CustomSquareImage(
                          imageType: ImageType.network,
                          imageUrl: productDetails.image,
                        ),
                      ),
                      sizedBox12,
                      Text(
                        productDetails.name,
                        style: textStyles.font32Black,
                      ),
                      sizedBox12,
                      Text(
                        "INR ${productDetails.price}",
                        style: textStyles.font16Black,
                      ),
                      SizedBox(
                        height: sizeChart.padding_8.h,
                      ),
                      Text(
                        productDetails.description,
                        style: textStyles.font14Grey,
                      ),
                      sizedBox12,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Quantity",
                            style: textStyles.font16Black,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              if (quantity != 1) {
                                quantity = quantity - 1;
                                ref.read(quantityProviderState.notifier).state =
                                    quantity;
                              }
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  color: colorsData.grey.withOpacity(0.4)),
                              child: Icon(Icons.remove,
                                  size: 20.sp, color: colorsData.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sizeChart.padding_24),
                            child: Text(
                              quantity.toString(),
                              style: textStyles.font20Black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              quantity = quantity + 1;
                              ref.read(quantityProviderState.notifier).state =
                                  quantity;
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  color: colorsData.grey.withOpacity(0.4)),
                              child: Icon(Icons.add,
                                  size: 20.sp, color: colorsData.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                buttonName: "Add to cart",
                onTap: () {
                  loadingScreen(context);
                  ProductViewService.addToCart(
                          productId: productDetails.id.toString(),
                          quantity: quantity.toString())
                      .then(
                    (value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      flushBarNotification(
                          context: context, title: "Added item to cart");
                    },
                  ).onError(
                    (error, stackTrace) {
                      Navigator.pop(context);
                      flushBarNotification(
                          context: context,
                          title: "Please try again later!",
                          failed: true);
                    },
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
