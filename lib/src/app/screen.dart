import 'package:flutter/material.dart';
import 'package:login/src/login/screen.dart';
import 'package:login/src/app/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Scaffold(
          body:Login(),
        ),
      ),
    );
  }
}