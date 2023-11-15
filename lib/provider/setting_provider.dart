import 'package:flutter/material.dart';
import 'package:todo_app/model/taskmodel.dart';
import 'package:todo_app/shared-components/network/my_database.dart';

import '../shared-components/utlies/snackbar_service.dart';

class SettingProvider extends ChangeNotifier {
  String currentlanguage = "en";
  ThemeMode currentTheme = ThemeMode.light;
  DateTime selectedDate = DateTime.now();

  void changeCurrentLanguage(String newLanguage) {
    if (currentlanguage == newLanguage) return;
    currentlanguage = newLanguage;
    notifyListeners();
  }

  void changeCurrentTheme(ThemeMode newtheme) {
    if (newtheme == currentTheme) return;
    currentTheme = newtheme;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  // String getMainBackGround() {
  //   return currentTheme == ThemeMode.dark
  //       ?
  //       :
  // }
  void EditTask(TaskModel taskModel) {
    MyDataBase.updateTask(taskModel!.id!, taskModel).then((value) {
      SnackBarService.showSuccessMessage("Task Done Successfully");
      notifyListeners();
    });
  }

  void setNewSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    MyDataBase.getTask(selectedDate);
    notifyListeners();
  }
}
