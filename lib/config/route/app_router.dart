import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

import 'package:auto_route/auto_route.dart';

import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';  // сгенерированный файл

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen, guards: [AuthGuard]),
    AutoRoute(page: ProfileScreen, guards: [AuthGuard]),
    AutoRoute(page: SettingsScreen, guards: [AuthGuard]),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class AppRouter extends _$AppRouter {}

// class MyApp extends StatelessWidget {
//   final _appRouter = AppRouter(
//     authGuard: AuthGuard(isAuthenticated: false), // Пример неавторизованного пользователя
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: _appRouter.delegate(),
//       routeInformationParser: _appRouter.defaultRouteParser(),
//     );
//   }
// }