import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LightTheme{
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white
  );
}

class DarkTheme{
  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: Colors.black
  );
}


class ThemeModeClass with ChangeNotifier{
  ThemeData _themeData = LightTheme.lightMode;
  ThemeData get themeData => _themeData;

  bool _isDark = false;


  void saveTheme() async{
    SharedPreferences savedTheme = await SharedPreferences.getInstance();
    await savedTheme.setBool("themeMode", _isDark);
  }

  Future<void> loadTheme() async{
    SharedPreferences loadedTheme = await SharedPreferences.getInstance();
    _isDark = loadedTheme.getBool("themeMode") ?? false;
    if(isDark){
      _themeData = DarkTheme.darkMode;
    }else{
      _themeData = LightTheme.lightMode;
    }
  }

  bool get isDark => _isDark;


  void toggleTheme(){
    _isDark = !_isDark;
    if(_isDark){
      _themeData = DarkTheme.darkMode;
    }else{
      _themeData = LightTheme.lightMode;
    }
    notifyListeners();
    saveTheme();
  }



}