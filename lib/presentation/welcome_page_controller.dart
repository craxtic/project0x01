import 'package:flutter/material.dart';
import 'package:project0x01/domain/settings.dart';
import 'package:project0x01/presentation/welcome_page.dart';
import 'package:project0x01/presentation/favorite_topics_page.dart';

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
  void previousPage() => setState(() => currentPage = _Page.welcome);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: currentPage == _Page.welcome
          ? WelcomePage(nextPage: nextPage, settings: widget.settings)
          : FavoriteTopicsPage(
              previousPage: previousPage,
              settings: widget.settings,
            ),
    );
  }
}
