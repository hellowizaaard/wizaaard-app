import 'package:flutter/material.dart';

import '../../../data/session_manager/user_prefs_manager.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserPrefsManager userPrefsManager;

  const LoginScreen({super.key, required this.userPrefsManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(userPrefsManager: userPrefsManager),
    );
  }
}
