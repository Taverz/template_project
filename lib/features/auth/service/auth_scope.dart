import '../areas/auth_area.dart';

class AuthScope {
  final AuthArea _authArea;

  AuthScope(this._authArea);

  Future<void> login(String username, String password) async {
    await _authArea.login(username, password);
  }

  Future<void> register(String username, String password) async {
    await _authArea.register(username, password);
  }
}
