import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/utils/api_routes/api_routes.dart';
import 'package:globsoft_ecommerce_application/utils/shared_data/image_path.dart';
import 'package:globsoft_ecommerce_application/utils/shared_preference/shared_preference.dart';
import 'package:globsoft_ecommerce_application/utils/size_chart/size_chart.dart';
import 'package:globsoft_ecommerce_application/utils/style/color_theme.dart';
import 'package:globsoft_ecommerce_application/utils/style/text_style.dart';
import 'package:globsoft_ecommerce_application/view/splashscreen/view/splashscreen.dart';

ApiRoutes apiRoutes = ApiRoutes();
SharedPreferenceModel sharedPreferenceModel = SharedPreferenceModel();
ImageData imageData = ImageData();
TextStyles textStyles = TextStyles();
IconImageData iconData = IconImageData();
ScreenUtil screenUtil = ScreenUtil();
ColorsData colorsData = ColorsData();
SizeChart sizeChart = SizeChart();


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          title: 'LuXuRiCe',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
