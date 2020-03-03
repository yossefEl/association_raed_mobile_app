import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //it returns true if data saved to shared prefs else it returns false
  static saveToSharedPrefrences(String userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userData", userData.toString());
    return prefs.getString(userData) != null;
  }

  //returns data related to the given key
  readFromSharedPrefrences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  //returns true if data removed else it returns false
  clearSharedPrefrences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    return prefs.getString(key) == null;
  }

  //clear all data...returns true if all data removed else it returns false
  clearAllSharedPrefrences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return prefs.getKeys() == null;
  }
}
