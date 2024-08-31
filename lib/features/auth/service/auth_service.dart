import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<Response> login(String username, String password) async {
    final response = await dio.post('/auth/login', data: {
      'username': username,
      'password': password,
    });

    return response;
  }

  Future<Response> register(String username, String password) async {
    final response = await dio.post('/auth/register', data: {
      'username': username,
      'password': password,
    });

    return response;
  }
}
