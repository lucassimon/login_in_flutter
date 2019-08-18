import 'package:flutter/material.dart';
import 'package:login/utils/validations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // this is not working well, raising an exception.
          // FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                emailField(),
                SizedBox(height: 10.0,),
                passwordField(),
                SizedBox(height: 40.0,),
                RaisedButton(
                  child: Text("Logar"),
                  onPressed: _submitForm,
                )
              ],
            ),
          )
        ),
      )
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 20.0),
      validator: validateEmail,
      onSaved: (String value) {
        setState(() {
          email = value;
        });
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 20.0),
      validator: validatePassword,
      onSaved: (String value) {
        setState(() {
          password = value;
        });
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_emailController.text);
      print(_passwordController.text);
      print(email);
      print(password);
      // Scaffold
      //   .of(context)
      //   .showSnackBar(SnackBar(content: Text('Autenticando')));
    }
  }
}