import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_floward/app/model/setting_model.dart';
import 'package:flutter_floward/app/service/translation_service.dart';
import 'package:flutter_floward/common/ui.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsService extends GetxService {
  final setting = Setting().obs;
  // final _settingsRepo = SettingRepository();

  SettingsService();

  Future<SettingsService> init() async {
    // setting.value = await _settingsRepo.get();
    return this;
  }

  ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      dividerColor: parseColor(setting.value.accentColor, opacity: 0.1),
      focusColor: parseColor(setting.value.accentColor),
      hintColor: parseColor(setting.value.secondColor),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: parseColor(setting.value.mainColor)),
      ),
      colorScheme: ColorScheme.light(
        primary: parseColor(setting.value.mainColor),
        secondary: parseColor(setting.value.mainColor),
      ),
      fontFamily: 'Helve',
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainColor), height: 1.3),
        headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondColor), height: 1.3),
        headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondColor), height: 1.3),
        headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondColor), height: 1.3),
        headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainColor), height: 1.4),
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.secondColor), height: 1.4),
        subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondColor), height: 1.2),
        subtitle1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.mainColor), height: 1.2),
        bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondColor), height: 1.2),
        bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondColor), height: 1.2),
        caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.accentColor), height: 1.2),
      ),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF252525),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0),
      scaffoldBackgroundColor: const Color(0xFF2C2C2C),
      brightness: Brightness.dark,
      dividerColor: parseColor(setting.value.accentDarkColor, opacity: 0.1),
      focusColor: parseColor(setting.value.accentDarkColor),
      hintColor: parseColor(setting.value.secondDarkColor),
      toggleableActiveColor: parseColor(setting.value.mainDarkColor),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: parseColor(setting.value.mainColor)),
      ),
      colorScheme: ColorScheme.dark(
        primary: parseColor(setting.value.mainDarkColor),
        secondary: parseColor(setting.value.mainDarkColor),
      ),
      fontFamily: 'Helve',
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainDarkColor), height: 1.3),
        headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondDarkColor), height: 1.3),
        headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondDarkColor), height: 1.3),
        headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondDarkColor), height: 1.3),
        headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainDarkColor), height: 1.4),
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.secondDarkColor), height: 1.4),
        subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondDarkColor), height: 1.2),
        subtitle1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.mainDarkColor), height: 1.2),
        bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondDarkColor), height: 1.2),
        bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondDarkColor), height: 1.2),
        caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.accentDarkColor), height: 1.2),
      ),
    );
  }

  ThemeData getWebLightTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      dividerColor: parseColor(setting.value.accentColor, opacity: 0.1),
      focusColor: parseColor(setting.value.accentColor),
      hintColor: parseColor(setting.value.secondColor),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: parseColor(setting.value.mainColor)),
      ),
      colorScheme: ColorScheme.light(
        primary: parseColor(setting.value.mainColor),
        secondary: parseColor(setting.value.mainColor),
      ),
      fontFamily: 'Helve',
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainColor), height: 1.3),
        headline5: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondColor), height: 1.3),
        headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondColor), height: 1.3),
        headline3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondColor), height: 1.3),
        headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainColor), height: 1.4),
        headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.secondColor), height: 1.4),
        subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondColor), height: 1.2),
        subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.mainColor), height: 1.2),
        bodyText2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondColor), height: 1.2),
        bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondColor), height: 1.2),
        caption: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.accentColor), height: 1.2),
      ),
    );
  }

  ThemeData getWebDarkTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF252525),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0),
      scaffoldBackgroundColor: const Color(0xFF2C2C2C),
      brightness: Brightness.dark,
      dividerColor: parseColor(setting.value.accentDarkColor, opacity: 0.1),
      focusColor: parseColor(setting.value.accentDarkColor),
      hintColor: parseColor(setting.value.secondDarkColor),
      toggleableActiveColor: parseColor(setting.value.mainDarkColor),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: parseColor(setting.value.mainColor)),
      ),
      colorScheme: ColorScheme.dark(
        primary: parseColor(setting.value.mainDarkColor),
        secondary: parseColor(setting.value.mainDarkColor),
      ),
      fontFamily: 'Helve',
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainDarkColor), height: 1.3),
        headline5: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondDarkColor), height: 1.3),
        headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondDarkColor), height: 1.3),
        headline3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.secondDarkColor), height: 1.3),
        headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: parseColor(setting.value.mainDarkColor), height: 1.4),
        headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.secondDarkColor), height: 1.4),
        subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondDarkColor), height: 1.2),
        subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.mainDarkColor), height: 1.2),
        bodyText2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: parseColor(setting.value.secondDarkColor), height: 1.2),
        bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: parseColor(setting.value.secondDarkColor), height: 1.2),
        caption: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: parseColor(setting.value.accentDarkColor), height: 1.2),
      ),
    );
  }

  Locale getLocale() {
    final String locale = GetStorage().read<String>('language') ?? setting.value.mobileLanguage;
    return Get.find<TranslationService>().fromStringToLocale(locale);
  }

  ThemeMode getThemeMode() {
    final String themeMode = GetStorage().read<String>('theme_mode') ?? '';
    switch (themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == 'dark') {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }
}
