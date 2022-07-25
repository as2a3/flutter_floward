import 'package:flutter_floward/app/model/base_model.dart';

class Setting extends Model {
  String appName = '';
  String? defaultCurrency;
  String defaultTheme = '';
  String mainColor = '';
  String mainDarkColor = '';
  String secondColor = '';
  String secondDarkColor = '';
  String accentColor = '';
  String accentDarkColor = '';
  String scaffoldDarkColor = '';
  String scaffoldColor = '';
  String mobileLanguage = 'tr';

  Setting(
      {this.appName = 'Floward',
      this.defaultCurrency,
      this.mainColor = '#F4841F',
      this.mainDarkColor = '#F4841F',
      this.secondColor = '#08143A',
      this.secondDarkColor = '#CCCCDD',
      this.accentColor = '#8C9DA8',
      this.accentDarkColor = '#9999AA',
      this.scaffoldDarkColor = '#2C2C2C',
      this.scaffoldColor = '#FFFFFF',
      this.mobileLanguage = 'tr',
      this.defaultTheme = 'light',
      });

  Setting.fromJson(Map<String, dynamic> json) {
    appName = stringFromJson(json, 'app_name', defaultValue: 'Kaptan');
    defaultCurrency = stringFromJson(json, 'default_currency', defaultValue: 'Kaptan');
    defaultTheme = stringFromJson(json, 'default_theme', defaultValue: 'light');
    mainColor = stringFromJson(json, 'main_color', defaultValue: '#F4841F');
    mainDarkColor = stringFromJson(json, 'main_dark_color', defaultValue: '#F4841F');
    secondColor = stringFromJson(json, 'second_color', defaultValue: '#08143A');
    secondDarkColor = stringFromJson(json, 'second_dark_color', defaultValue: '#CCCCDD');
    accentColor = stringFromJson(json, 'accent_color', defaultValue: '#8C9DA8');
    accentDarkColor = stringFromJson(json, 'accent_dark_color', defaultValue: '#9999AA');
    scaffoldDarkColor = stringFromJson(json, 'scaffold_dark_color', defaultValue: '#2C2C2C');
    scaffoldColor = stringFromJson(json, 'scaffold_color', defaultValue: '#FFFFFF');
    mobileLanguage = stringFromJson(json, 'mobile_language', defaultValue: 'tr');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['default_currency'] = defaultCurrency;
    data['main_color'] = mainColor;
    data['default_theme'] = defaultTheme;
    data['main_dark_color'] = mainDarkColor;
    data['second_color'] = secondColor;
    data['second_dark_color'] = secondDarkColor;
    data['accent_color'] = accentColor;
    data['accent_dark_color'] = accentDarkColor;
    data['scaffold_dark_color'] = scaffoldDarkColor;
    data['scaffold_color'] = scaffoldColor;
    data['mobile_language'] = mobileLanguage;
    return data;
  }
}
