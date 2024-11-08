import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/button/button.dart';
import 'package:globsoft_ecommerce_application/utils/custom_app_bar/custom_app_bar.dart';
import 'package:globsoft_ecommerce_application/utils/flushbar/flushbar.dart';
import 'package:globsoft_ecommerce_application/utils/loading_screen/loading_screen.dart';
import 'package:globsoft_ecommerce_application/utils/no_data_page/no_data_page.dart';
import 'package:globsoft_ecommerce_application/view/cart/service/service.dart';
import 'package:globsoft_ecommerce_application/view/cart/view/widgets/cart_view_component.dart';
import 'package:globsoft_ecommerce_application/view/cart/view/widgets/checkout_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: FutureBuilder(
        future: CartService.getCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData&&snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CartViewComponent(
                          productDetails: snapshot.data![index]);
                    },
                  ),
                ),
                SizedBox(
                  height: sizeChart.padding_12.h,
                ),
                CheckoutButton(),
                SizedBox(
                  height: sizeChart.padding_12.h,
                ),
              ],
            );
          } else {
            return NoDataPage();
          }
        },
      ),
    );
  }
}
