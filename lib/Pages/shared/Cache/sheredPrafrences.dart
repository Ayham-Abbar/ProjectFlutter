import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
 static late SharedPreferences sharedPreferences;
  //Initialization
 static void cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  //Methods
  //set Data
 static Future<void> setData({required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      print('تمت إضافة الرقم') ;
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
      print('تمت إضافة الاسم') ;
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
      print('تمت إضافة القيمة البوليانية') ;
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
      print('تمت إضافة الرقم العشري') ;
    }else
    print('  حدث خطأ ما في التخزين السريع') ;
  }

//get data
 static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //Delete data
 static void deleteData({required String key}) {
    sharedPreferences.remove(key);
  }
  //Clear Data
 static  void clearData({required String key}) {
    sharedPreferences.clear();
  }
}
