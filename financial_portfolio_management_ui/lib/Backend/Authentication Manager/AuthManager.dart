import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();
  factory AuthManager() => _instance;

  AuthManager._internal() {
    init();
  }

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isLoggedIn() async {
    await init(); // Ensure _prefs is initialized
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    await init(); // Ensure _prefs is initialized
    await _prefs.setBool('isLoggedIn', value);
  }
}
