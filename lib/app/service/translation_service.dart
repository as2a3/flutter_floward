import 'package:flutter/cupertino.dart';
import 'package:flutter_floward/common/helper.dart';
import 'package:get/get.dart';

class TranslationService extends GetxService {
  final translations = <String, Map<String, String>>{}.obs;
  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = const Locale('en', 'US');

  // must add language codes here
  static final languages = [
    'en',
    'ar',
  ];

  // initialize the translation service by loading the assets/locales folder
  // the assets/locales folder must contains file for each language that named
  // with the code of language concatenate with the country code
  // for example (en.json)
  Future<TranslationService> init() async {
    for (final lang in languages) {
      final file = await Helper.getJsonFile('assets/locales/$lang.json');
      translations.putIfAbsent(lang, () => Map<String, String>.from(file as Map));
    }
    return this;
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationService.languages.map((locale) {
      return fromStringToLocale(locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String locale) {
    if (locale.contains('_')) {
      // en_US
      return Locale(locale.split('_').elementAt(0), locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(locale);
    }
  }
}
