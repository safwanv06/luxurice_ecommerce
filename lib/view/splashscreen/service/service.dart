

import '../../../main.dart';
import '../../../utils/shared_data/shared_data.dart';
import '../model/model.dart';

class SplashScreenService {
  static Future<AuthState> authStateCheck() async {
    String token =
        await sharedPreferenceModel.get(key: SharedPreferenceKey.token);
    if (token == "") {
      return AuthState.notAuthenticated;
    } else {
      return AuthState.authenticated;
    }
  }
}
