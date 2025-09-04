import 'package:flutter/material.dart';
import 'package:project0x01/core/theme.dart';
import 'package:project0x01/data/local_storage.dart';
import 'package:project0x01/domain/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  LocalStorage storage = LocalStorage(preferences);
  Settings settings = Settings(storage);

  runApp(MainApp(settings: settings));
}

class MainApp extends StatelessWidget {
  final Settings settings;

  const MainApp({required this.settings, super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: settings.getThemeMode(),
      home: Scaffold(body: Text("hello, world")),
    );
  }
}
