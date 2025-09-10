import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project0x01/core/theme.dart';
import 'package:project0x01/data/local_storage.dart';
import 'package:project0x01/domain/settings.dart';
import 'package:project0x01/presentation/welcome_page_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

  // this triggers to rebuild entire app
  void rebuild() => setState(() => _toggleRebuild = !_toggleRebuild);

  @override
  Widget build(BuildContext context) {
    print("MainApp rebuild");

    return MaterialApp(
      title: "project0x01",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: _settings.getThemeMode(),
      home: _settings.hasSeenWelcome()
        ? Center(child: Text("main")) // main page
        : WelcomePageController(settings: _settings),
    );
  }
}
