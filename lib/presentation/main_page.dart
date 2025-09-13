import 'package:flutter/material.dart';
import 'package:project0x01/core/dictionary.dart';
import 'package:project0x01/domain/settings.dart';
import 'package:project0x01/core/configs.dart';

class MainPage extends StatefulWidget {
  final Settings settings;

  const MainPage({required this.settings, super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  late BottomNavigationDest _currentPage;
  late ThemeMode _themeMode;
  late Language _language;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.settings.getThemeMode();
    _language = widget.settings.getLanguage();
    _currentPage = BottomNavigationDest.home;
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _getCurrentPage(),
    );
  }

  Widget _getCurrentPage() {
    List<Widget> pages = [
      Center(child: Text("Category")),
      Center(child: Text("Home")),
      Center(child: Text("Library")),
    ];

    return pages[_currentPage.index];
  }

  NavigationBar _bottomNavigationBar() {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.category),
          label: Dictionary.buttomNavigationBar[_language]![BottomNavigationDest.category]!,
        ),
        NavigationDestination(
          icon: Icon(Icons.home), 
          label: Dictionary.buttomNavigationBar[_language]![BottomNavigationDest.home]!,
        ),
        NavigationDestination(
          icon: Icon(Icons.library_books),
          label: Dictionary.buttomNavigationBar[_language]![BottomNavigationDest.library]!,
        ),
      ],
      selectedIndex: _currentPage.index,
      onDestinationSelected: (int index) {
        setState(() {
          _currentPage = BottomNavigationDest.values[index];
        });
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: MenuAnchor(
        childFocusNode: _buttonFocusNode,
        menuChildren: [
          _themeModeMenuButton(),
          _languageMenuButton(),
          _fontSizeMenuButton(),
          _aboutUsMenuButton(),
        ],
        builder: _menuAnchorBuilder,
      ),
    );
  }

  Widget _menuAnchorBuilder(_, MenuController controller, Widget? child) {
    return IconButton(
      focusNode: _buttonFocusNode,
      onPressed: () {
        if (controller.isOpen) {
          controller.close();
        } else {
          controller.open();
        }
      },
      icon: const Icon(Icons.more_vert),
    );
  }

  MenuItemButton _aboutUsMenuButton() {
    return MenuItemButton(
      onPressed: () => print("about us"),
      child: Text("about us"),
    );
  }

  SubmenuButton _fontSizeMenuButton() {
    return SubmenuButton(
      menuChildren: [
        MenuItemButton(
          onPressed: () => widget.settings.setFontSize(FontSize.small),
          child: Text("small"),
        ),
        MenuItemButton(
          onPressed: () => widget.settings.setFontSize(FontSize.medium),
          child: Text("meduim"),
        ),
        MenuItemButton(
          onPressed: () => widget.settings.setFontSize(FontSize.large),
          child: Text("large"),
        ),
      ],
      child: Text("font size"),
    );
  }

  MenuItemButton _languageMenuButton() {
    return MenuItemButton(
      onPressed: () {
        _language = _language == Language.khmer
            ? Language.english
            : Language.khmer;
        widget.settings.setLanguage(_language);
      },
      child: Row(
        children: [
          Text(_language.name),
          const Spacer(),
          _language == Language.khmer
              ? Icon(Icons.temple_buddhist)
              : Icon(Icons.abc),
        ],
      ),
    );
  }

  MenuItemButton _themeModeMenuButton() {
    return MenuItemButton(
      onPressed: () {
        _themeMode = _themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
        widget.settings.setThemeMode(_themeMode);
      },
      child: Row(
        children: [
          Text(_themeMode.name),
          const Spacer(),
          _themeMode == ThemeMode.dark
              ? Icon(Icons.dark_mode)
              : Icon(Icons.sunny),
        ],
      ),
    );
  }
}
