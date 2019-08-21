import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/src/dashboard/screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:login/storages/shared_storage.dart';
import 'package:login/storages/storages.dart';
import 'package:login/src/utils/alerts.dart';
import 'package:login/src/utils/nav.dart';
import 'package:login/src/login/validators.dart';
import 'package:login/src/login/repositories.dart';

class LoginBloc extends BlocBase with Validators {
  final _authRepository = AuthRepository();
  final _email = BehaviorSubject<String>(); 
  final _password = BehaviorSubject<String>();

  BuildContext _context;

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  set context(BuildContext context) => this._context = context;

  login(String email, String password) async {
    try {
      Response response = await _authRepository.login(email, password);
      // save to Shared Or Secure Local Storage (problem on api version dependency. Needs up to 24) ...
      SharedStorage sharedStorage = SharedStorage();
      Storage storage = Storage(sharedStorage);
      await storage.save('login-in-flutter-token', response.data['token']);
      await storage.save('login-in-flutter-refresh', response.data['token']);
      // Goes to Dashboard
      pushReplacement(_context, Dashboard());
    } catch (e) {
      // Rreturn a failed message to Login Screen SnackBar??
      alert(_context, "Autenticação");
      throw Exception("some error occurred");
    }
  }

  submit() async {
    final validEmail = _email.value;
    final validPassword = _password.value;
    await login(validEmail, validPassword);
  }

  @override
  dispose() {
    _email.close();
    _password.close();
    super.dispose();
  }
}