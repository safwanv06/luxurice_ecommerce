
import '../service/model/model.dart';

isSignInValid({required SignInModel signInModel}){
  return signInModel.email==""||signInModel.password=="";
}
