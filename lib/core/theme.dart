import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project0x01/core/configs.dart';
import 'package:project0x01/core/dictionary.dart';

abstract final class AppThemes {
  static Future<void> loadFonts() async {
    await Future.wait([
       FontLoader(FontFamily.khmer).load(),
       FontLoader(FontFamily.english).load(),
    ]);
  }

  static ThemeData getDark(Language lang, double fontSize) {
    return ThemeData(
      fontFamily: lang == Language.khmer
          ? FontFamily.khmer
          : FontFamily.english,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: fontSize)),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black87,
      extensions: [],
    );
  }

  static ThemeData getLight(Language lang, double fontSize) {
    return ThemeData(
      fontFamily: lang == Language.khmer
          ? FontFamily.khmer
          : FontFamily.english,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: fontSize)),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      extensions: [],
    );
  }
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
