import 'package:flutter/material.dart';
import 'package:login/src/app/provider.dart';
import 'package:login/src/app/bloc.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 40.0,),
          emailField(bloc),
          SizedBox(height: 10.0,),
          passwordField(bloc),
          SizedBox(height: 40.0,),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {

    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, snapshot) {
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

  Widget passwordField(Bloc bloc) {

    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
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

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Entrar'),
          color: Colors.teal,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}