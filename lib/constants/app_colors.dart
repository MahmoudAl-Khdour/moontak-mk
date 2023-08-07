import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color _appWhiteColor = Colors.white;

  static const Color _appGreyColor = Colors.grey;

  static const Color _appTealColor = Color(0xFFccf3e7);

  static const Color _appLightTealColor = Color(0xFFe9faf5);

  static const Color _appCreamColor = Color(0xFFf0f8f5);

  static const Color _appBlackColor = Colors.black;

  static const Color _appErrorColor = Colors.red;
  static const Color _appRedAccentColor = Colors.redAccent;
  static const Color _appSuccessColor = Colors.green;

  static const Color _appDefaultColor = Color(0xFF274884);

  static const Color _appBackgroundColor = Color(0xFFEFEFF7);

  static const Color _appTextColor = Colors.black54;

  static final Color _appIconColor = Colors.grey[600]!;

  static final Color _appBorderColor = Colors.blueGrey.withOpacity(0.3);

  static Color? get appWhiteColor => _appWhiteColor;
  static Color? get appLightTealColor => _appLightTealColor;
  static Color? get appTealColor => _appTealColor;
  static Color? get appCreamColor => _appCreamColor;

  static Color get appBlackColor => _appBlackColor;

  static Color get appErrorColor => _appErrorColor;

  static Color get appSuccessColor => _appSuccessColor;
  static Color get appRedAccentColor => _appRedAccentColor;

  static Color get appDefaultColor => _appDefaultColor;

  static Color get appBackgroundColor => _appBackgroundColor;

  static Color get appGreyColor => _appGreyColor;

  static Color get appTextColor => _appTextColor;

  static Color get appIconColor => _appIconColor;

  static Color get appBorderColor => _appBorderColor;
  static const MaterialColor _kPrimaryColor = MaterialColor(
    0xFF274884,
    <int, Color>{
      50: Color(0xFF274884),
      100: Color(0xFF274884),
      200: Color(0xFF274884),
      300: Color(0xFF274884),
      400: Color(0xFF274884),
      500: Color(0xFF274884),
      600: Color(0xFF274884),
      700: Color(0xFF274884),
      800: Color(0xFF274884),
      900: Color(0xFF274884),
    },
  );

  static MaterialColor get kPrimaryColor => _kPrimaryColor;
}
