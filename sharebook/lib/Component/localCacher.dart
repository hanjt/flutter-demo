import 'package:shared_preferences/shared_preferences.dart';

const String _key = 'SBUid';

/**
 * 
 * 保存uid
 * 
 */
saveUid(String uid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(_key, uid);
}

/**
 * 
 * 删除uid
 * 
 */
deleteUid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(_key);
  prefs.clear();
}

/** 
 * 
 * 查找uid
 * 
 */
Future<String> findUid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.getString(_key);
}