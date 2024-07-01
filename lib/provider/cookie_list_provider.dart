import 'package:cookies_2024/model/cookie.dart';
import 'package:cookies_2024/service/cookie_service.dart';
import 'package:flutter/material.dart';

class CookieListProvider extends ChangeNotifier {
  CookieListProvider(this._cookieService);

  List<Cookie> get cookies {
    return _cookieService.readAll();
  }

  void addCookie(String wisdom, String author) {
    _cookieService
        .create(Cookie(wisdom, author: author))
        .then((_) => {notifyListeners()});
  }

  final CookieService _cookieService;

  void deleteCookie(String id) {
    _cookieService.delete(id).then((_) => {notifyListeners()});
  }
}
