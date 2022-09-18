import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/account_screen.dart';
import '../screens/settings.dart';
import '../helpers/store_helper.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

void goToHome(BuildContext context) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
}

void goToProfile(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const AccountScreen()));
}

void goTOSettingScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SettingScreen()));
}

void goToRegister(BuildContext context) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const RegisterScreen()));
}

void goToLogin(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
}

void logOut(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false);
}

void distroySession(BuildContext context) async {
  await StoreHelper().clearStorage();

  // ignore: use_build_context_synchronously
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      ModalRoute.withName("/Home"));
}

void goToVerificationCode(BuildContext context) {}
