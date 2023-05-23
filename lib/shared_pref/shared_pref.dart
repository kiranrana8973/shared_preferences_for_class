import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPref {
  late SharedPreferences _sharedPreferences;

  // Add username and password to shared pref
  Future addUser(User user) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString('username', user.username);
    _sharedPreferences.setString('password', user.password);
  }

  // Get username and password from shared pref
  Future<User> getUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final username = _sharedPreferences.getString('username');
    final password = _sharedPreferences.getString('password');
    return User(
      username: username ?? '',
      password: password ?? '',
    );
  }
}
