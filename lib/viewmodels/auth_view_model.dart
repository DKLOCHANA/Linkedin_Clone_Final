import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AuthViewModel extends ChangeNotifier {
  User? _registeredUser;

  void register(String username, String password) {
    _registeredUser = User(username: username, password: password);
    notifyListeners();
  }

  bool login(String username, String password) {
    if (_registeredUser == null) {
      return false;
    }
    return _registeredUser!.username == username &&
        _registeredUser!.password == password;
  }
}
