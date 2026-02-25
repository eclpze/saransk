import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 16),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontWeight: FontWeight.w900, fontSize: 17)
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xff5B7BFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}

class DarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 16, color: Colors.white),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          titleSmall: TextStyle(fontWeight: FontWeight.w900, fontSize: 17, color: Colors.white)
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xff5B7BFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}

class ThemeChange with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme()
  {
    _isDark = !_isDark;
    notifyListeners();
  }
}



