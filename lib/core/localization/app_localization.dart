import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
  Map<String, String>? _localizationStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString("lang/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizationStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String? translate(String key) {
    return _localizationStrings![key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }
}
