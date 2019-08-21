import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:login/src/login/bloc.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.getBloc<LoginBloc>();
    bloc.context = context;
    return Material(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40.0,),
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 80.0,),
          submitButton(bloc),
        ],
      ),
    );
  }
  // TODO: Refactoring this code to email and password use the same CustomTextField
  Widget emailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: 'name@email.com',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Sua senha',
            labelText: "Senha",
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, snapshot) {
        return RaisedButton(
          child: Text('Entrar'),
          color: Colors.teal,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}