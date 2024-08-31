import '../services/auth_service.dart';

class AuthArea {
  final AuthService _authService;

  AuthArea(this._authService);

  Future<void> login(String username, String password) async {
    try {
      final response = await _authService.login(username, password);
      // Обработка успешного входа
      print('Login successful: ${response.data}');
    } catch (e) {
      // Обработка ошибок при входе
      print('Login failed: $e');
    }
  }

  Future<void> register(String username, String password) async {
    try {
      final response = await _authService.register(username, password);
      // Обработка успешной регистрации
      print('Registration successful: ${response.data}');
    } catch (e) {
      // Обработка ошибок при регистрации
      print('Registration failed: $e');
    }
  }
}
