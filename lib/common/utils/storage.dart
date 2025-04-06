import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// kv离线存储
class Storage {
  // 调用 Storage 类的私有构造函数 _internal 来创建一个新的 Storage 实例，并将其赋值给 _instance 变量
  static final Storage _instance = Storage._internal();

  // 工厂构造函数，每次调用 Storage 的默认构造函数时，都会返回 _instance，确保只有一个 Storage 实例
  factory Storage() => _instance;

  late final SharedPreferences _prefs;

  // 私有构造函数，用于创建 Storage 实例
  Storage._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setJson(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
