import 'package:flutter/material.dart';
import 'package:project0x01/core/dictionary.dart';
import 'package:project0x01/core/theme.dart';
import 'package:project0x01/data/local_storage.dart';
import 'package:project0x01/domain/settings.dart';
import 'package:project0x01/presentation/main_page.dart';
import 'package:project0x01/presentation/welcome_page_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage storage = LocalStorage();
  await storage.initialize();
  await AppThemes.loadFonts();

  runApp(MainApp(storage: storage));
} 

class MainApp extends StatefulWidget {
  final LocalStorage storage;
  const MainApp({required this.storage, super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final Settings _settings;

  late ThemeData _dark;
  late ThemeData _light;
  late bool _toggleRebuild = false;

  @override
  void initState() {
    super.initState();
    _toggleRebuild = false;
    _settings = Settings(widget.storage, rebuild);
    Language lang = _settings.getLanguage();
    double fontSize = _settings.getFonSize();
    _dark = AppThemes.getDark(lang, fontSize);
    _light = AppThemes.getLight(lang, fontSize);
  }

  // this triggers to rebuild entire app
  void rebuild() => setState(() => _toggleRebuild = !_toggleRebuild);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "project0x01",
      debugShowCheckedModeBanner: false,
      theme: _light,
      darkTheme: _dark,
      themeMode: _settings.getThemeMode(),
      home: _settings.hasSeenWelcome()
          ? MainPage(settings: _settings) // main page
          : WelcomePageController(settings: _settings),
    );
  }

  // TODO: reimplement this

  // Future<int> setup() async {
  //   Language lang = _settings.getLanguage();
  //   double fontSize = _settings.getFonSize();
  //   dark = await AppThemes.getDark(lang, fontSize);
  //   light = await AppThemes.getLight(lang, fontSize);
  //   return 0;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   print("MainApp rebuild");
  //   return FutureBuilder<int>(
  //     future: setup(),
  //     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
  //       if (snapshot.hasData) {
  //         return MaterialApp(
  //           title: "project0x01",
  //           debugShowCheckedModeBanner: false,
  //           theme: light,
  //           darkTheme: dark,
  //           themeMode: _settings.getThemeMode(),
  //           home: _settings.hasSeenWelcome()
  //               ? MainPage(settings: _settings) // main page
  //               : WelcomePageController(settings: _settings),
  //         );
  //       }
  //       return Placeholder();
  //     },
  //   );
  // }
}
