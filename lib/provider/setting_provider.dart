import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentlanguage = "en";

  void changeCurrentLanguage(String newLanguage) {
    if (currentlanguage == newLanguage) return;
    currentlanguage = newLanguage;
    notifyListeners();
  }
}
