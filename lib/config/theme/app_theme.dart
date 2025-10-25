import 'package:flutter/material.dart';

class AppColorTheme {
  static final ThemeData appTheme = ThemeData(
    primarySwatch: AppColors.primary,
    hintColor: const Color(0xFFEB7867),
    primaryColor: const Color(0xFFB54D3D),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    /*pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      })
  */
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: appTheme.primaryColor,
    colorScheme: ColorScheme.dark(primary: appTheme.primaryColor),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: appTheme.primaryColor,
    colorScheme: ColorScheme.light(primary: appTheme.primaryColor),
    dividerColor: Colors.black,
  );

  static final Color primary = Color(0xFFB54D3D);
  static final Color secondary = const Color(0xFFEB7867);
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary_light = Color(0xFFF8EEEC);
}

class AppColors {
  static const MaterialColor primary = MaterialColor(
    0xFF388e3c,
    <int, Color>{
      50: Color(0xFFEB7867),
      100: Color(0xFFEB7867),
      200: Color(0xFFEB7867),
      300: Color(0xFFEB7867),
      400: Color(0xFFEB7867),
      500: Color(0xFFEB7867),
      600: Color(0xFFEB7867),
      700: Color(0xFFEB7867),
      800: Color(0xFFEB7867),
      900: Color(0xFFEB7867),
    },
  );
}

