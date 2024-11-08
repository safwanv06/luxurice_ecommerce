import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';
import '../../../../utils/button/button.dart';
import '../../../../utils/flushbar/flushbar.dart';
import '../../../../utils/loading_screen/loading_screen.dart';
import '../../../../utils/textfield/text_field.dart';
import '../../../home/view/home_view.dart';
import '../../sign_up/view/sign_up_view.dart';
import '../controller/controller.dart';
import '../service/model/model.dart';
import '../service/service.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: sizeChart.padding_48.h,
                    ),
                    Image.asset(
                      imageData.logoTransparent,
                      height: screenUtil.screenHeight / 10,
                    ),
                    SizedBox(
                      height: sizeChart.padding_48.h,
                    ),
                    Text(
                      "Sign In",
                      style: textStyles.font32Black,
                    ),
                    SizedBox(
                      height: sizeChart.padding_24.h,
                    ),
                    CustomTextField(
                      title: "Username",
                      prefix: Icon(
                        Icons.person,
                        color: colorsData.grey,
                        size: 18.sp,
                      ),
                      hintText: "Enter Username",
                      textEditingController: emailController,
                      onChanged: (text) {},
                    ),
                    CustomTextField(
                      title: "Password",
                      prefix: Icon(
                        Icons.lock,
                        color: colorsData.grey,
                        size: 18.sp,
                      ),
                      hintText: "Enter Password",
                      textEditingController: passwordController,
                      onChanged: (text) {},
                    ),
                    SizedBox(
                      height: sizeChart.padding_16.h,
                    ),
                    CustomButton(
                      buttonName: "Sign In",
                      onTap: () {
                        SignInModel signInModel = SignInModel(
                            email: emailController.text,
                            password: passwordController.text);
                        if (!isSignInValid(signInModel: signInModel)) {
                          loadingScreen(context);
                          SignInService().signIn(signInModel: signInModel).then(
                                (value) {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ));
                            },
                          ).onError(
                                (error, stackTrace) {
                              Navigator.pop(context);
                              flushBarNotification(
                                  context: context,
                                  title:
                                  "Sign in failed! check your credentials and please try again.",
                                  failed: true);
                            },
                          );
                        } else {
                          flushBarNotification(
                              context: context,
                              title: "Enter valid credentials",
                              failed: true);
                        }
                      },
                    ),
                    SizedBox(
                      height: sizeChart.padding_48.h,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpView(),
                              ));
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Don’t Have a account?",
                                style: textStyles.font14Black),
                            TextSpan(
                                text: " Create Account",
                                style: textStyles.font16Brown),
                          ]),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
