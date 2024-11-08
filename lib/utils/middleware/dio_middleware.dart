import 'package:dio/dio.dart';

import '../../main.dart';
import '../shared_data/shared_data.dart';

final dio = Dio();

/// middleware which handles token and  other details if any but in this project there is an issue with api that i can't access response using dio package
Dio dioApiCall() {
  var userToken = '';
  dio.interceptors.add(InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    userToken == ''
        ? userToken =
            await sharedPreferenceModel.get(key: SharedPreferenceKey.token)
        : null;
    if (userToken != '') {
      options.headers['Accept'] = 'application/json';
      options.headers['Authorization'] = 'Bearer $userToken';
    }
    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }, onError: (DioException exception, ErrorInterceptorHandler handler) {
    return handler.next(exception);
  }));
  return dio;
}
