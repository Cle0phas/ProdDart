import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  MaterialColor appColor = Colors.orange;

  MaterialColor get getAppColor {
    return appColor;
  }

  void changeAppColor(MaterialColor color) {
    appColor = color;
    notifyListeners();
  }
}
