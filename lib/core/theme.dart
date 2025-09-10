import 'package:flutter/material.dart';

abstract final class AppThemes {
  static final ThemeData light = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    extensions: [],
  );
  static final ThemeData dark = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    extensions: [],
  );
}

// TODO: implement this

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
