import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalizationService {
  Locale _locale;
  Map<String, String> _localizedStrings;

  LocalizationService(this._locale, this._localizedStrings);

  String translate(String key) => _localizedStrings[key] ?? key;

  Locale get locale => _locale;

  static Future<LocalizationService> load(String localeCode) async {
    Locale locale = Locale(localeCode);
    String jsonContent = await rootBundle.loadString('assets/lang/$localeCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonContent);

    // Extracción de las traducciones específicas de la pestaña "tab2"
    Map<String, String> localizedStrings = {};
    if (jsonMap.containsKey('tabs') && jsonMap['tabs'].containsKey('tab2')) {
      jsonMap['tabs']['tab2'].forEach((key, value) {
        localizedStrings[key] = value.toString();
      });
    }

    return LocalizationService(locale, localizedStrings);
  }

  void update(LocalizationService newService) {
    _locale = newService._locale;
    _localizedStrings = newService._localizedStrings;
  }
}

