import 'package:flutter/material.dart';
import 'package:login/src/app/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();
  bool updateShouldNotify(_) => true;

  Provider({Key key, Widget child}): super(key: key, child: child);

  static Bloc of(context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}