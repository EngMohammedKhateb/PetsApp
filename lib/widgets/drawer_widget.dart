import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/store_helper.dart';
import '../themes/theme_service.dart';
import '../utils/navigation.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Image.asset(!ThemeService().isDarkModeActive()
                ? 'assets/images/logo.png'
                : 'assets/images/logo.png'),
            const SizedBox(height: 20),
            ListTile(
                onTap: () {
                  goToProfile(context);
                },
                leading: Image.asset(
                  'assets/images/user.png',
                  width: 30,
                ),
                title: Text("profile".tr)),
            ListTile(
                onTap: () {
                  goToProfile(context);
                },
                leading: Image.asset(
                  'assets/images/graduation.png',
                  width: 30,
                ),
                title: Text("my courses".tr)),
            ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/images/send-mail.png',
                  width: 30,
                ),
                title: Text("chat with manager".tr)),
            ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/images/certificate.png',
                  width: 30,
                ),
                title: Text("certificates".tr)),
            ListTile(
                onTap: () {
                  goTOSettingScreen(context);
                },
                leading: Image.asset(
                  'assets/images/settings.png',
                  width: 30,
                ),
                title: Text("settings".tr)),
            ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/images/coder.png',
                  width: 30,
                ),
                title: Text("app developer".tr)),
            ListTile(
                onTap: () {},
                leading: Image.asset(
                  'assets/images/privacy.png',
                  width: 30,
                ),
                title: Text("privacy_policy".tr)),
            ListTile(
                onTap: () {
                  StoreHelper().clearStorage();
                  logOut(context);
                },
                leading: Image.asset(
                  'assets/images/logout.png',
                  width: 30,
                ),
                title: Text("logout".tr)),
          ],
        ),
      ),
    );
  }
}
