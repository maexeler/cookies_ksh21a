// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:uuid/uuid.dart';

class Cookie {
  Cookie(this._wisdom, {author = ''})
      : _author = author,
        _id = Uuid().v4();

  String get id => _id;
  String get wisdom => _wisdom;
  String get author => _author;

  String _id;
  String _wisdom;
  String _author;
}
