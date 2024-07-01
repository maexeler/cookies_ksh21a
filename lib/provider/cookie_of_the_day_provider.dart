import 'dart:math';
import 'package:flutter/material.dart';

import 'package:cookies_2024/model/cookie.dart';
import 'package:cookies_2024/service/cookie_service.dart';

class CookieOfTheDayProvider extends ChangeNotifier {
  CookieOfTheDayProvider(this._cookieService) {
    createNewCookieOfTheDay();
  }

  Cookie get cookieOfTheDay => _cookieOfTheDay;

  void createNewCookieOfTheDay() {
    var cookies = _cookieService.readAll();
    if (cookies.isEmpty) {
      _cookieOfTheDay = _noCookieToDay;
    } else {
      _cookieOfTheDay = cookies[Random().nextInt(cookies.length)];
    }
    notifyListeners();
  }

  final CookieService _cookieService;
  Cookie _cookieOfTheDay = _noCookieToDay;
}

Cookie _noCookieToDay = Cookie("No cookie today", author: "bad luck");
