import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:project0x01/core/dictionary.dart';

enum FontSize { small, medium, large }

enum Topics {
  none,
  algebra,
  geometry,
  inequality,
  numberTheory,
} // TODO: this should be dynamic, not static

abstract final class DefaultSettings {
  
  static ThemeMode getSystemThemeMode() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }
  
  static const Language language = Language.khmer;
  static const FontSize fontSize = FontSize.medium;
  static const List<Topics> favoriteTopicList = [Topics.none];
}
