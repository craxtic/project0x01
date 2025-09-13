import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:project0x01/core/dictionary.dart';

enum Topics {
  none,
  algebra,
  geometry,
  inequality,
  numberTheory,
} // TODO: this should be dynamic, not static


enum BottomNavigationDest{
  category,
  home,
  library
}


abstract final class FontSize {
  static const double small = 12;
  static const double medium = 14;
  static const double large = 16;
}

abstract final class FontFamily {
  static String khmer = "KhmerMuol";
  static String english = "Poppins";
}

abstract final class DefaultSettings {
  static ThemeMode getSystemThemeMode() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  static const Language language = Language.khmer;
  static const double fontSize = FontSize.medium;
  static const List<Topics> favoriteTopicList = [Topics.none];
}
