import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _saveInfoKey = "saveInfoKey";
  static const _saveInfoHourlyKey = "saveInfoHourlyKey";
  static const _saveStatusKey = "authStatus";

  static Future setAuthStatus(bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(_saveStatusKey, value);
  }

  static Future getAuthStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var res = _prefs.getBool(_saveStatusKey);
    return res;
  }

  static Future setWeather(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_saveInfoKey, value);
  }

  static Future getWeather() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var res = _prefs.getString(_saveInfoKey);
    return res;
  }

  static Future setWeatherHourly(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_saveInfoHourlyKey, value);
  }

  static Future getWeatherHourly() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var res = _prefs.getString(_saveInfoHourlyKey);
    return res;
  }
}
