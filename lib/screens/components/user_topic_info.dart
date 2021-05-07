import 'package:shared_preferences/shared_preferences.dart';

class UserTopicInfo {
  static SharedPreferences _info;

  static Future init() async => _info = await SharedPreferences.getInstance();

  static Future setBool(bool value, String topic) async =>
      await _info.setBool(topic, value);

  static bool? getBool(String key) => _info.getBool(key);
}
