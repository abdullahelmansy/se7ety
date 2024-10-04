import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static const String token = 'token';
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static cacheDate({required String key, required dynamic value}) {
    if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else {
      sharedPreferences.setStringList(key, value);
    }
  }

  static dynamic getCachedData({required String key}) {
    return sharedPreferences.get(key);
  }
}
