import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future putData(String key, bool moode) async {
    await sharedPreferences!.setBool(key, moode);
  }

  static bool? getData(String key) {
    return sharedPreferences!.getBool(key);
  }
}
