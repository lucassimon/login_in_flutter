import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:login/storages/storages.dart';

class SharedStorage extends Object with AdapterInterface {

  static final SharedStorage _instance = SharedStorage.internal();
  factory SharedStorage() => _instance;
  SharedStorage.internal();

  SharedPreferences _conn;

  Future<SharedPreferences> get conn async { 
    if (_conn != null) {
      return _conn;
    } else {
      _conn = await connect();
      return _conn;
    }
  }

  connect() async => await SharedPreferences.getInstance();

  save(String key, dynamic value) async {
    print('save $value on $key');
    SharedPreferences cmd = await conn;
    return cmd.setString(key, value);
  }

  fetch(String key) async {
    SharedPreferences cmd = await conn;
    return cmd.getString(key);
  }

  delete(String key) async {
    SharedPreferences cmd = await conn;
    return cmd.setString(key, null);
  }

  clear() async => print('purge all');
}
