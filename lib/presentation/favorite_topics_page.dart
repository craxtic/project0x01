import 'package:flutter/material.dart';
import 'package:project0x01/core/configs.dart';
import 'package:project0x01/core/dictionary.dart';
import 'package:project0x01/domain/settings.dart';

class FavoriteTopicsPage extends StatelessWidget {
  final Settings settings;
  final VoidCallback previousPage;

  FavoriteTopicsPage({
    required this.settings,
    required this.previousPage,
    super.key,
  });

  late Language _language = settings.getLanguage();
  late ThemeMode _themeMode = settings.getThemeMode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
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
          _FavoriteTopicsChoices(_language, settings),
          const Spacer(),
          _backButton(),
          const Spacer(),
          _getStartedButton(),
        ],
      ),
    );
  }

  ElevatedButton _backButton() {
    return ElevatedButton(
      onPressed: () {
        previousPage();
      },
      child: Text(Dictionary.favoriteTopicsPage[_language]!["back-button"]!),
    );
  }

  ElevatedButton _getStartedButton() {
    return ElevatedButton(
      onPressed: () {
        settings.seenWelcome();
      },
      child: Text(
        Dictionary.favoriteTopicsPage[_language]!["get-started-button"]!,
      ),
    );
  }
}

///
///
///
///
class _FavoriteTopicsChoices extends StatefulWidget {
  final Language language;
  final Settings settings;

  const _FavoriteTopicsChoices(this.language, this.settings, {super.key});

  @override
  State<_FavoriteTopicsChoices> createState() => _FavoriteTopicsChoicesState();
}

class _FavoriteTopicsChoicesState extends State<_FavoriteTopicsChoices> {
  late Set<Topics> _selectedTopics;

  @override
  void initState() {
    super.initState();
    _selectedTopics = widget.settings.getFavoriteTopicList().toSet();
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: _getTopicButtonSegmentList(),
      selected: _selectedTopics,
      onSelectionChanged: (Set<Topics> newSelectedTopics) {
        setState(() {
          _selectedTopics = newSelectedTopics;
          // TODO: try to find a better implementation
          // problem: it writes to local storage every time new selection occurs
          widget.settings.setFavoriteTopicList(_selectedTopics.toList());
        });
      },
      multiSelectionEnabled: true,
    );
  }

  List<ButtonSegment<Topics>> _getTopicButtonSegmentList() {
    List<ButtonSegment<Topics>> list = [];
    for (Topics topic in Topics.values) {
      if (topic == Topics.none) continue;
      ButtonSegment<Topics> segment = ButtonSegment<Topics>(
        value: topic,
        label: Text(Dictionary.topicStrings[widget.language]![topic]!),
      );
      list.add(segment);
    }
    return list;
  }
}
