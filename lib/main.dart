import 'package:flutter/material.dart';
import 'package:project0x01/core/theme.dart';
import 'package:project0x01/data/local_storage.dart';
import 'package:project0x01/domain/settings.dart';
import 'package:project0x01/presentation/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  LocalStorage storage = LocalStorage(preferences);

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
  late bool _toggleRebuild = false;

  @override
  void initState() {
    super.initState();
    _settings = Settings(widget.storage, rebuild);
    _toggleRebuild = false;
  }

  // this trigger to rebuild entire app
  void rebuild() => setState(() => _toggleRebuild = !_toggleRebuild);

  @override
  Widget build(BuildContext context) {
    print("rebuild");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: _settings.getThemeMode(),
      home: _settings.hasSeenWelcome()
          ? Placeholder() // main page
          : WelcomePageController(settings: _settings),
    );
  }
}

enum _Page { welcome, favoriteTopics }

class WelcomePageController extends StatefulWidget {
  final Settings settings;

  const WelcomePageController({required this.settings, super.key});

  @override
  State<WelcomePageController> createState() => _WelcomePageControllerState();
}

class _WelcomePageControllerState extends State<WelcomePageController> {
  _Page currentPage = _Page.welcome;

  void nextPage() => setState(() => currentPage = _Page.favoriteTopics);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 2),
      child: currentPage == _Page.welcome
          ? WelcomePage(nextPage: nextPage, settings: widget.settings)
          : Scaffold(body: Center(child: Text("favorite topics page"))),
    );
  }
}
