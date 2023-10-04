import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get themeData => _isDarkMode
      ? ThemeData.dark().copyWith(primaryColor: Colors.blue[900])
      : ThemeData.light().copyWith(primaryColor: Colors.lightBlue[900]);

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
