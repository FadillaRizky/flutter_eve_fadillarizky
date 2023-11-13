import 'package:shared_preferences/shared_preferences.dart';

import 'models/data_user.dart';

class LoginPref {
  static Future<bool> saveIsFirstTime(bool isFirst) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("isFirst")) {
      pref.remove("isFirst");
    }
    pref.setBool("isFirst", isFirst);

    return true;
  }
  static Future <DataUser> getPrefSplash() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    DataUser dataUser = DataUser();
    dataUser.isLogin = pref.getBool("isFirst");
    return dataUser;
  }
  static Future<bool> checkIsFirstTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool status = pref.containsKey("isFirst");
    return status;
  }
  static Future<bool> removePrefSplash() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("isFirst");
    return true;
  }

}
