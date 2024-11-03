import 'package:flutter/material.dart';
import 'package:movie_ticket/helper/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('vi');

  Locale get appLocale => _appLocale;

  fetchLocaleApp() async {
    var prefs = await SharedPreferences.getInstance()!;
    if ((prefs.getString('language_code') ?? '') != 'vi') {
      _appLocale = const Locale('vi');
      return _appLocale;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    notifyListeners();
    return _appLocale;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("vi")) {
      _appLocale = const Locale("vi");
      await prefs.setString('language_code', 'vi');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }

    notifyListeners();
  }
}
