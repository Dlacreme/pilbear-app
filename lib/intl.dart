
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String translate(context, key) {
  return Translate.of(context).translate(key);
}

class Translate {
  final Locale locale;

  Translate(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<Translate> delegate =  _TranslateDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = '';
    try {
      jsonString = await rootBundle.loadString('locales/${locale.languageCode}.json');
    } catch(e) {
      jsonString = await rootBundle.loadString('locales/en.json');
    }
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    final translation = _localizedStrings[key];
    return translation != null ? translation : 'TRANSLATION FAILED';
  }
}

class _TranslateDelegate
  extends LocalizationsDelegate<Translate> {
  const _TranslateDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<Translate> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    Translate localizations = new Translate(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_TranslateDelegate old) => false;
}