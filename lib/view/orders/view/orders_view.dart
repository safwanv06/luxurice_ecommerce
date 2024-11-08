import 'package:flutter/material.dart';
import 'package:globsoft_ecommerce_application/utils/custom_app_bar/custom_app_bar.dart';
import 'package:globsoft_ecommerce_application/utils/no_data_page/no_data_page.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';
import 'package:globsoft_ecommerce_application/view/orders/service/model/model.dart';
import 'package:globsoft_ecommerce_application/view/orders/service/service.dart';
import 'package:globsoft_ecommerce_application/view/orders/view/order_details_view.dart';
import 'package:globsoft_ecommerce_application/view/orders/view/widgets/order_view_component.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Orders",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: FutureBuilder(
        future: OrdersService.getOrders(),
        builder: (context, AsyncSnapshot<List<OrderedItemModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailsView(
                              address: snapshot.data![index].address,
                              totalAmount: snapshot.data![index].totalAmount,
                              orderedItems:
                                  snapshot.data![index].orderedProducts,
                            ),
                          ));
                    },
                    child: OrderViewComponent(
                        orderDetails: snapshot.data![index]));
              },
            );
          } else {
            return const NoDataPage();
          }
        },
      ),
    );
  }
}
