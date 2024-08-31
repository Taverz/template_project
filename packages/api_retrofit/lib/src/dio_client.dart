import 'package:dio/dio.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient(String baseUrl, {Dio? dioInstance})
      : dio = dioInstance ?? Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
    ]);
    dio.interceptors.add(DioLogger());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (obj) {
        logger.d(obj);
      },
    ));
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: 'https://api.example.com/')).interceptor);
  }

  Dio get client => dio;
}

var logger = Logger();
