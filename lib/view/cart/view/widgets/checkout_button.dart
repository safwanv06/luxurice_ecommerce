import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/view/cart/service/model/model.dart';
import 'package:location/location.dart';

import '../../../../utils/button/button.dart';
import '../../../../utils/flushbar/flushbar.dart';
import '../../../../utils/loading_screen/loading_screen.dart';
import '../../service/service.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeChart.padding_12),
      child: CustomButton(
        buttonName: "Checkout",
        onTap: () async {
          loadingScreen(context);
          CartService.locationServices().then((value) {
            if (value is LocationModel) {
              CartService.checkoutCart(locationModel: value).then(
                (value) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  flushBarNotification(
                      context: context, title: "Order placed!");
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
            } else {
              throw Error();
            }
          }).onError(
            (error, stackTrace) {
              Navigator.pop(context);
              flushBarNotification(
                  context: context,
                  title:
                      "Please enable location services to continue and try again",
                  warning: true);
            },
          );
        },
      ),
    );
  }
}
