import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/utils/button/button.dart';
import 'package:globsoft_ecommerce_application/utils/shared_data/shared_data.dart';
import 'package:globsoft_ecommerce_application/view/cart/view/cart_view.dart';
import 'package:globsoft_ecommerce_application/view/home/view/widgets/drawer_tile.dart';
import 'package:globsoft_ecommerce_application/view/orders/view/orders_view.dart';

import '../../../../main.dart';
import '../../../../utils/loading_screen/loading_screen.dart';
import '../../../authentication/sign_in/view/sign_in_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer(builder: (context, ref, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(sizeChart.padding_16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeChart.padding_48.h,
                ),
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                      child: Image.asset(
                    imageData.profile,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(imageData.profile);
                    },
                    height: screenUtil.screenHeight / 5,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  height: sizeChart.padding_48.h,
                ),
                DrawerTile(
                    title: "View Cart",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartView(),
                          ));
                    }),
                SizedBox(
                  height: sizeChart.padding_12.h,
                ),
                DrawerTile(
                    title: "Orders",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrdersView(),
                          ));
                    }),
                SizedBox(
                  height: sizeChart.padding_12.h,
                ),
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: sizeChart.padding_8.w),
                  child: CustomButton(
                    buttonName: "Logout",
                    onTap: () async {
                      loadingScreen(context);
                      await sharedPreferenceModel.clear();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInView(),
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: sizeChart.padding_24.h,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
