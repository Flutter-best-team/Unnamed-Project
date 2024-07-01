import 'package:shared_preferences/shared_preferences.dart';

class ProfileStorage {

  static final String regKey = "registered";

  static final List<String> profileInfoItems = [
    'name',
    'gender',
    'height',
    'weight',
    'birthday'
  ];


  static Future<void> toRegistrete(List<String> profileInfo) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(regKey, true);
  }

  static Future<bool> isRegistreted(List<String> profileInfo) async{
    final prefs = await SharedPreferences.getInstance();
    bool? reg = await prefs.getBool(regKey);
    return reg??false;
  }

  static Future<void> setProfile(List<String> profileInfo) async{
    final prefs = await SharedPreferences.getInstance();

    if(profileInfoItems.length != profileInfo.length){
      print("Error with setting profile data");
      return;
    }

    for(int i = 0; i < profileInfo.length; i++){
      prefs.setString(profileInfoItems[i], profileInfo[i]);
    }

  }

  
}