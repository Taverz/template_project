import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Логика обновления токена или редирект на авторизацию
      // Например, вы можете обновить токен и повторить запрос
      // Если обновление токена прошло успешно
      final Dio dio = err.requestOptions.extra['dio'] as Dio;
      final RequestOptions options = err.requestOptions;
      
      try {
        final newToken = await _refreshToken();
        options.headers['Authorization'] = 'Bearer $newToken';
        
        // Повторяем запрос с новым токеном
        final response = await dio.request(options.path, options: Options(
          method: options.method,
          headers: options.headers,
        ));
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    } else if (err.response?.statusCode == 400) {
      // Обработка 400 ошибок, например, отображение сообщения
      print("Bad Request: ${err.response?.data}");
    }

    super.onError(err, handler);
  }

  Future<String> _refreshToken() async {
    // Логика обновления токена
    await Future.delayed(Duration(seconds: 2));
    return 'new_access_token';
  }
}
