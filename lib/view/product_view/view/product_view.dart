import 'package:flutter/material.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/custom_app_bar/custom_app_bar.dart';
import 'package:globsoft_ecommerce_application/utils/no_data_page/no_data_page.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';
import 'package:globsoft_ecommerce_application/view/product_view/service/service.dart';
import 'package:globsoft_ecommerce_application/view/product_view/view/widget/product_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductViewService.getProductDetails(id: productId),
      builder: (context, AsyncSnapshot<ProductData> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: CustomAppBar(
              title: "",
              onBackPressed: () {
                Navigator.pop(context);
              },
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
              appBar: CustomAppBar(
                title: snapshot.data!.name,
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              body: ProductViewComponent(productDetails: snapshot.data!));
        } else {
          return Scaffold(
              appBar: CustomAppBar(
                title: "Item not found",
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              body: NoDataPage());
        }
      },
    );
  }
}
