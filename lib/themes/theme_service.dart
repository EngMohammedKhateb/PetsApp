import '../helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../helpers/hex_helpers.dart';

class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    // fontFamily: 'Cairo',
    primaryColor: HexColor("#6d4aff"),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: buildMaterialColor(HexColor("#6d4aff"))),
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.black12,
    brightness: Brightness.light,
    cardColor: Colors.white,
    focusColor: const Color(0xFFADC4C8),
    backgroundColor: const Color(0xFFeeeeee),
    hintColor: const Color(0xFF52575C),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Colors.black,
      textStyle: const TextStyle(color: Colors.black),
    )),
    textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Cairo',
        bodyColor: Colors.black87,
        displayColor: Colors.black87),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Cairo',
        bodyColor: Colors.black54,
        displayColor: Colors.black54),

    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    }),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: blueColor,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.white54,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF2C2C2C),
    backgroundColor: const Color(0xFF2C2C2C),
    cardColor: const Color(0xFF252525),
    hintColor: const Color(0xFFE7F6F8),
    focusColor: const Color(0xFFADC4C8),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Colors.white,
      textStyle: const TextStyle(color: Colors.white),
    )),
    textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Cairo',
        bodyColor: Colors.white54,
        displayColor: Colors.white54),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Cairo',
        bodyColor: Colors.white54,
        displayColor: Colors.white54),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    }),
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isDarkModeActive() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isDarkModeActive() ? ThemeMode.light : ThemeMode.dark;
  }

  void changeTheme() {
    Get.changeThemeMode(isDarkModeActive() ? ThemeMode.dark : ThemeMode.light);
    saveThemeData(!isDarkModeActive());
  }
}
