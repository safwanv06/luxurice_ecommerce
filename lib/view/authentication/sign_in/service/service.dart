import 'dart:convert';

import 'package:http/http.dart';

import '../../../../main.dart';
import '../../../../utils/shared_data/shared_data.dart';
import 'model/model.dart';

class SignInService {
  Future signIn({required SignInModel signInModel}) async {
    try {
      Response response = await post(Uri.parse(apiRoutes.signIn), body: {
        "username": signInModel.email,
        "password": signInModel.password
      });
      if (response.statusCode == 200) {
        String data= response.body.replaceAll("Connected successfully", "");
        Map data1 = jsonDecode(data);
        await sharedPreferenceModel.set(
            key: SharedPreferenceKey.token, keyValue: data1["token"]);
        // await sharedPreferenceModel.set(
        //     key: SharedPreferenceKey.userName, keyValue: signInModel.email);
        return response.body;
      } else {
        throw Error();
      }
    } catch (e) {
      print("the error is $e");
      rethrow;
    }
  }
}
