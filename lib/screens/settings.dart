import '../helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/localization_service.dart';
import '../themes/theme_service.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                splashRadius: 20,
                splashColor: primaryColor,
                tooltip: 'go back',
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          const SizedBox(
            height: 20,
          ),
          SwitchListTile(
            value: !ThemeService().isDarkModeActive(),
            onChanged: (bool isActive) => ThemeService().changeTheme(),
            title: Text(
              'dark theme'.tr,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          CheckboxListTile(
            value: LocalizationService().getLanguage() == "English",
            title: Text(
              'english'.tr,
            ),
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool? value) {
              LocalizationService().changeLanguage('English');
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CheckboxListTile(
            value: LocalizationService().getLanguage() == "Arabic",
            title: Text(
              'arabic'.tr,
            ),
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool? value) {
              LocalizationService().changeLanguage('Arabic');
            },
          ),
        ],
      ),
    );
  }
}
