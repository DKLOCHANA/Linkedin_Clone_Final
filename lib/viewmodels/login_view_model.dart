import 'package:email_validator/email_validator.dart';

class LoginViewModel {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email can not be empty';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password can not be empty';
    }

    return null;
  }
}
