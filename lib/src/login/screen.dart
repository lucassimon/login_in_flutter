import 'package:flutter/material.dart';
import 'package:login/src/login/widgets.dart';


class Login extends StatelessWidget {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    // final LoginBloc bloc = BlocProvider.getBloc<LoginBloc>();
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
