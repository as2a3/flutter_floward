import 'package:flutter/material.dart';
import 'package:flutter_floward/app/provider/api_client_provider.dart';
import 'package:flutter_floward/app/routes/app_pages.dart';
import 'package:flutter_floward/app/service/settings_service.dart';
import 'package:flutter_floward/app/service/translation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => ApiClient().init());
  await Get.putAsync(() => SettingsService().init());
  Get.log('All services started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    GetMaterialApp(
      title: Get.find<SettingsService>().setting.value.appName,
      initialRoute: initialRout,
      getPages: routes,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: Get.find<TranslationService>().supportedLocales(),
      translationsKeys: Get.find<TranslationService>().translations,
      locale: Get.find<SettingsService>().getLocale(),
      fallbackLocale: Get.find<TranslationService>().fallbackLocale,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: Get.find<SettingsService>().getThemeMode(),
      theme: Get.find<SettingsService>().getLightTheme(),
      darkTheme: Get.find<SettingsService>().getDarkTheme(),
    ),
  );
}
