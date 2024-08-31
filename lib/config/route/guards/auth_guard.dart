import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  final bool isAuthenticated;

  AuthGuard({required this.isAuthenticated});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      // Разрешить переход, если авторизован
      resolver.next(true);
    } else {
      // Перенаправить на страницу авторизации, если не авторизован
      router.push(LoginRoute());
    }
  }
}
