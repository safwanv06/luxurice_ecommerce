import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/utils/no_data_page/no_data_page.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';
import 'package:globsoft_ecommerce_application/view/home/view/widgets/corousal_slider.dart';
import 'package:globsoft_ecommerce_application/view/home/view/widgets/drawer.dart';
import 'package:globsoft_ecommerce_application/view/home/view/widgets/home_screen_component.dart';
import 'package:globsoft_ecommerce_application/view/home/view/widgets/loading_screen.dart';
import 'package:globsoft_ecommerce_application/view/product_view/view/product_view.dart';

import '../../../main.dart';
import '../../../utils/loading_screen/loading_screen.dart';
import '../../authentication/sign_in/view/sign_in_view.dart';
import '../service/service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Image.asset(
          imageData.logoTransparent,
          height: 40.h,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: HomeService().getHomeScreenData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else if (snapshot.hasData) {
                return Padding(
                  padding:  EdgeInsets.all(sizeChart.padding_12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CorousalSlider(products: snapshot.data!,),
                      SizedBox(height: sizeChart.padding_12.h,),
                      Text("Products",style: textStyles.font32Black,),
                      SizedBox(height: sizeChart.padding_8.h,),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            ProductData product = snapshot.data![index];
                            return HomeScreenComponent(
                              product: product,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const NoDataPage();
              }
            }),
      ),
    );
  }
}
