import 'package:flutter/material.dart';
import 'package:weebird_app/features/auth/presentation/pages/forgot_password_otp_screen.dart';
import 'package:weebird_app/features/auth/presentation/pages/login_screen.dart';
import 'package:weebird_app/features/auth/presentation/pages/register_screen.dart';
import 'package:weebird_app/presentation/views/home/main_screen.dart';

import 'app_router.dart';

class RouteGenerator {

  static Route<dynamic> generate(RouteSettings settings) {
    final email = settings.arguments as String?;

    switch (settings.name) {
      case AppRouter.login:
        return MaterialPageRoute(    builder: (_) => LoginScreen(email: email ?? ""));

      case AppRouter.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case AppRouter.otp:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordOtpScreen(),
        );

      case AppRouter.home:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(
            userName: "userName",
            email: "email",
            deptName: "deptName",
            mobile: "mobile",
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text("Page not found"))),
    );
  }
}
