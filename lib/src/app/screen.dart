import 'package:flutter/material.dart';

import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:login/src/app/bloc.dart';
import 'package:login/src/login/bloc.dart';
import 'package:login/src/login/screen.dart';
import 'package:login/src/dashboard/screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Scaffold(
          body:Login(),
        ),
      ),
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => AppBloc()),
        Bloc((i) => LoginBloc()),
      ],
    );
  }
}