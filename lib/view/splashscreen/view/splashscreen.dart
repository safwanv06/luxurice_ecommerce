import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../authentication/sign_in/view/sign_in_view.dart';
import '../../home/view/home_view.dart';
import '../model/model.dart';
import '../service/service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SplashScreenService.authStateCheck(),
        builder: (context, AsyncSnapshot<AuthState> snapshot) {
          if (snapshot.hasData) {
            Future.delayed(const Duration(seconds: 3)).then(
              (value) {
                if (snapshot.data == AuthState.authenticated) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInView(),
                      ));
                }
              },
            );
          }
          return Container(
            height: screenUtil.screenHeight,
            width: screenUtil.screenWidth,
            color: Colors.white,
            child: Center(child: Image.asset(imageData.logo)),
          );
        },
      ),
    );
  }
}
