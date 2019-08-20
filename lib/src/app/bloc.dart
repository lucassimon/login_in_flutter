import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

import 'package:login/storages/shared_storage.dart';
import 'package:login/storages/storages.dart';
import 'package:login/src/login/validators.dart';
import 'package:login/src/login/repositories.dart';

class Bloc extends Object with Validators {
  final _authRepository = AuthRepository();
  final _email = BehaviorSubject<String>(); 
  final _password = BehaviorSubject<String>();


  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  login(String email, String password) async {
    print('call auth repository with $email and $password to do a login');
    try {
      Response response = await _authRepository.login(email, password);
      // save to Shared Or Secure Local Storage (problem on api version dependency. Needs up to 24) ...
      SharedStorage sharedStorage = SharedStorage();
      Storage storage = Storage(sharedStorage);
      await storage.save('login-in-flutter-token', response.data['token']);
      await storage.save('login-in-flutter-refresh', response.data['token']);
    } catch (e) {
      // TODO: how to return a failed message to Login Screen
      throw Exception("Some error occurred on Login");
    }
  }

  submit() async {
    final validEmail = _email.value;
    final validPassword = _password.value;
    login(validEmail, validPassword);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}