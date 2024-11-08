import 'dart:convert';

import 'package:globsoft_ecommerce_application/utils/api_routes/api_routes.dart';
import 'package:http/http.dart';

import '../../../../main.dart';
import '../../../../utils/middleware/dio_middleware.dart';
import '../../../../utils/shared_data/shared_data.dart';
import 'model/model.dart';

class SignUpService {
  Future signUp({required SignUpModel signUpModel}) async {
    try {
      Map data = {
        "username": signUpModel.name,
        "email": signUpModel.mail,
        "password": signUpModel.password
      };
      Response response =
          await post(Uri.parse(apiRoutes.signUp), body: data);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
