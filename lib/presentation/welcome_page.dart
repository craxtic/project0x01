import 'package:flutter/material.dart';
import 'package:project0x01/core/dictionary.dart';
import 'package:project0x01/domain/settings.dart';

class WelcomePage extends StatelessWidget {
  final Settings settings;
  final VoidCallback nextPage;

  WelcomePage({required this.nextPage, required this.settings, super.key});

  late ThemeMode _themeMode;
  late Language _language;

  @override
  Widget build(BuildContext context) {
    _themeMode = settings.getThemeMode();
    _language = settings.getLanguage();

    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      // adding style
      leading: _languageToggleButton(),
      actions: [_themeModeToggleButton()],
    );
  }

  IconButton _themeModeToggleButton() {
    return IconButton(
      onPressed: () {
        _themeMode = _themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
        settings.setThemeMode(_themeMode);
      },
      icon: AnimatedSwitcher(
        // key: ValueKey<int>(_themeMode.index),
        duration: Duration(),
        child: _themeMode == ThemeMode.dark
            ? Icon(Icons.sunny)
            : Icon(Icons.dark_mode),
      ),
    );
  }

  IconButton _languageToggleButton() {
    return IconButton(
      onPressed: () {
        _language = _language == Language.khmer
            ? Language.english
            : Language.khmer;
        settings.setLanguage(_language);
      },
      icon: AnimatedSwitcher(
        // key: ValueKey<int>(_language.index),
        duration: Duration(),
        child: _language == Language.khmer
            ? Icon(Icons.temple_buddhist)
            : Icon(Icons.abc),
      ),
    );
  }

  Container _body() {
    return Container(
      padding: EdgeInsets.all(25),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Text(Dictionary.welcomePage[_language]!["title"]!),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              nextPage();
            },
            child: Text(Dictionary.welcomePage[_language]!["button"]!),
          ),
        ],
      ),
    );
  }
}



// class WelcomePage extends StatefulWidget {
//   final Settings settings;

//   const WelcomePage({required this.settings, super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
  // late ThemeMode _themeMode;
  // late Language _language;

  // @override
  // void initState() {
  //   super.initState();
  //   _themeMode = widget.settings.getThemeMode();
  //   _language = widget.settings.getLanguage();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   print("welcome page rebuild");

  //   return Scaffold(appBar: _appBar(), body: _body());
  // }

  // AppBar _appBar() {
  //   return AppBar(
  //     leading: _languageToggleButton(),
  //     actions: [_themeModeToggleButton()],
  //   );
  // }

  // IconButton _themeModeToggleButton() {
  //   return IconButton(
  //     onPressed: () {
  //       _themeMode = _themeMode == ThemeMode.dark
  //           ? ThemeMode.light
  //           : ThemeMode.dark;
  //       widget.settings.setThemeMode(_themeMode);
  //     },
  //     icon: AnimatedSwitcher(
  //       // key: ValueKey<int>(_themeMode.index),
  //       duration: Duration(),
  //       child: _themeMode == ThemeMode.dark
  //           ? Icon(Icons.sunny)
  //           : Icon(Icons.dark_mode),
  //     ),
  //   );
  // }

  // IconButton _languageToggleButton() {
  //   return IconButton(
  //     onPressed: () {
  //       _language = _language == Language.khmer
  //           ? Language.english
  //           : Language.khmer;
  //       widget.settings.setLanguage(_language);
  //     },
  //     icon: AnimatedSwitcher(
  //       // key: ValueKey<int>(_language.index),
  //       duration: Duration(),
  //       child: _language == Language.khmer
  //           ? Icon(Icons.temple_buddhist)
  //           : Icon(Icons.abc),
  //     ),
  //   );
  // }

  // Container _body() {
  //   return Container(
  //     padding: EdgeInsets.all(25),
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: Column(
  //       children: [
  //         Text(Dictionary.welcomePage[_language]!["title"]!),
  //         const Spacer(),
  //         ElevatedButton(
  //           onPressed: () {
  //             print("continue");
  //           },
  //           child: Text(Dictionary.welcomePage[_language]!["button"]!),
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }
