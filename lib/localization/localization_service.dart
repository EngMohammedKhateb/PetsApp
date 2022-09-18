import 'dart:ui';

import 'ar.dart';
import 'en.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  static const localar = Locale("ar", "AR");
  static const localen = Locale("en", "EN");

  static const languages = ["Arabic", "English"];

  static const locales = [Locale("ar", "AR"), Locale("en", "EN")];

  @override
  Map<String, Map<String, String>> get keys => {'ar': ar, 'en': en};

  void changeLanguage(String language) {
    GetStorage().write('language', language);
    final locale = _getLocaleFromLanguage(language);
    Get.updateLocale(locale);
  }

  String getLanguage() {
    return GetStorage().read('language') ?? "English";
  }

  Locale initLanguage() {
    String s = GetStorage().read('language') ?? "English";
    return _getLocaleFromLanguage(s);
  }

  Locale _getLocaleFromLanguage(String language) {
    for (int i = 0; i < languages.length; i++) {
      if (language == languages[i]) {
        return locales[i];
      }
    }
    return Get.locale!;
  }
}
