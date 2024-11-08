import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globsoft_ecommerce_application/view/authentication/sign_in/view/sign_in_view.dart';

import '../../../../main.dart';
import '../../../../utils/button/button.dart';
import '../../../../utils/flushbar/flushbar.dart';
import '../../../../utils/loading_screen/loading_screen.dart';
import '../../../../utils/textfield/text_field.dart';
import '../controller/controller.dart';
import '../service/model/model.dart';
import '../service/service.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenUtil.screenHeight,
        width: screenUtil.screenWidth,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageData.logoTransparent,
                    height: screenUtil.screenHeight / 10,
                  ),
                  SizedBox(
                    height: sizeChart.padding_48.h,
                  ),
                  Text(
                    "Create Account",
                    style: textStyles.font32Black,
                  ),
                  SizedBox(
                    height: sizeChart.padding_24.h,
                  ),
                  CustomTextField(
                    title: "Username",
                    hintText: "Enter Username",
                    prefix: Icon(
                      Icons.person,
                      color: colorsData.grey,
                      size: 18.sp,
                    ),
                    textEditingController: nameController,
                    onChanged: (text) {},
                  ),
                  CustomTextField(
                    prefix: Icon(
                      Icons.mail_rounded,
                      color: colorsData.grey,
                      size: 18.sp,
                    ),
                    title: "E mail",
                    hintText: "Enter E mail",
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
                    height: sizeChart.fontSize16.h,
                  ),
                  CustomButton(
                    buttonName: "Sign Up",
                    onTap: () async {
                      SignUpModel signUpModel = SignUpModel(
                          name: nameController.text,
                          mail: emailController.text,
                          password: passwordController.text);
                      if (validateSignUpData(signUpModel: signUpModel)) {
                        flushBarNotification(
                            context: context,
                            title: "Enter valid data",
                            failed: true);
                      } else {
                        loadingScreen(context);
                        SignUpService().signUp(signUpModel: signUpModel).then(
                          (value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInView(),
                                ));
                            flushBarNotification(
                                context: context, title: "Success");
                          },
                        ).onError(
                          (error, stackTrace) {
                            Navigator.pop(context);
                            flushBarNotification(
                                context: context,
                                title: "User exists!",
                                failed: true);
                          },
                        );
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
                              builder: (context) => SignInView(),
                            ));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Already have an account?",
                              style: textStyles.font14Black),
                          TextSpan(text: " Login", style: textStyles.font16Brown),
                        ]),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
