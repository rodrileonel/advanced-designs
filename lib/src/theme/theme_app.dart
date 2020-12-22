

import 'package:flutter/material.dart';

class ThemeApp with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  ThemeApp(int theme){
    switch(theme){
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
      break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(value){
    this._darkTheme = value;
    this._customTheme = false;

    if(value == true)
      this._currentTheme = ThemeData.dark();
    else
      this._currentTheme = ThemeData.light();

    notifyListeners();
  }

  set customTheme(value){
    this._customTheme = value;
    this._darkTheme = false;

    if(value == true)
      this._currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.orange[900],
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: TextTheme(bodyText2: TextStyle(color:Colors.white)),
      );
    else
      this._currentTheme = ThemeData.light();

    notifyListeners();
  }
}