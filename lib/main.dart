import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petsapp/providers/account_view_model.dart';
import 'package:petsapp/providers/auth_viewmodel.dart';
import 'package:petsapp/providers/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'localization/localization_service.dart';
import 'providers/category_viewmodel.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'themes/theme_service.dart';

void main() async {
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => CategoryViewModel()),
      ChangeNotifierProvider(create: (_) => AccountViewModel()),
    ],
    child: GetMaterialApp(
      locale: LocalizationService().initLanguage(),
      fallbackLocale: LocalizationService.localar,
      translations: LocalizationService(),
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/SplashScreen': (context) => const SplashScreen(),
        '/Login': (context) => const LoginScreen(),
        '/Signup': (context) => const RegisterScreen(),
      },
      initialRoute: '/HomeScreen',
      debugShowCheckedModeBanner: false,
    ),
  ));
}
