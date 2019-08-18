import 'package:login/utils/messages.dart';

class ValidationMixin {
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return Messages.invalidEmail;
    }

    return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return Messages.passwordRequired;
    }
    return null;
  }
}