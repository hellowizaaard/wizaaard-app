import 'package:flutter/material.dart';

import '../config/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final String? route;
  final bool replace;
  final VoidCallback? onPressed;
  final bool colorPrimary;

  const PrimaryButton({
    super.key,
    required this.title,
    this.route,
    this.replace = false,
    this.onPressed,
    this.colorPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed:
            onPressed ??
            () {
              if (route == null) return;
              if (replace) {
                Navigator.pushReplacementNamed(context, route!);
              } else {
                Navigator.pushNamed(context, route!);
              }
            },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary
              ? AppColorTheme.primary
              : AppColorTheme.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
