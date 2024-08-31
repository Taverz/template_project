import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? accessToken;

  AuthInterceptor({this.accessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
