import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Here the intialize of cache
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! this method to get string data in local database using key
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! this method to get any type data already saved in local database
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! this method to remove data using key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local data base contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! this method to clear all data in local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
