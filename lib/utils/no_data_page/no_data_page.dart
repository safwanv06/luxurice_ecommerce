import 'package:flutter/material.dart';
import 'package:globsoft_ecommerce_application/main.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      imageData.noDataImage,
      height: screenUtil.screenHeight / 3,
    ));
  }
}
