import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isLight = true;

  void cahngeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }

  bool get isLight => _isLight;
}
