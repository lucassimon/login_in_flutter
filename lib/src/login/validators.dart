import 'dart:async';

import 'package:login/src/utils/messages.dart';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (email.trim().isEmpty) {
        sink.addError(Messages.emailRequired);
      } else if (!regex.hasMatch(email)) {
        sink.addError(Messages.emailInvalid);
      } else {
        sink.add(email);
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.trim().isEmpty) {
        sink.addError(Messages.passwordRequired);
      } else if (password.length < 3) {
        sink.addError(Messages.passwordLteTenChars);
      } else {
        sink.add(password);
      }
    }
  );
}