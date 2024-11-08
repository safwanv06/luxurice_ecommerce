
import '../service/model/model.dart';

bool validateSignUpData({required SignUpModel signUpModel}) {
  return signUpModel.name == "" ||
      signUpModel.mail == "" ||
      signUpModel.password == "";
}
