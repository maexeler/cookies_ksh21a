import 'package:cookies_2024/model/cookie.dart';

// Implements CRUD behavior
class CookieService {
  /// Create
  Future<void> create(Cookie cookie) async {
    _cookies.insert(0, cookie);
    return _save();
  }

  /// Read
  List<Cookie> readAll() {
    // read from cache
    return List.unmodifiable(_cookies);
  }

  /// Update
  Future<void> update(String id, String? wisdom, String author) async {
    // todo modify and save
  }

  /// Delete
  Future<void> delete(String id) async {
    // todo : delete and save
  }

  /// Call load() once before using the service
  Future<void> load() async {
    // todo : load data from a server or DB
    _cookies = _fakeData;
    return Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> _save() async {
    // todo : should save data to a server or DB
  }

  List<Cookie> _cookies = [];
}

List<Cookie> _fakeData = [
  Cookie("Happy wife, happy live"),
  Cookie("42", author: "Deep Thought"),
  Cookie("Use your towel", author: "Ford Perfect"),
];
