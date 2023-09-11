import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selected => _selectedIndex;

  set selected(int i) {
    _selectedIndex = i;
    notifyListeners();
  }
}
