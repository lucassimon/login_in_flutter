import 'package:flutter/material.dart';

import 'package:login/src/login/screen.dart';
import 'package:login/src/dashboard/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _onClickLogout,
          )
        ],
      ),
      body: Container(child: Text("render the dashboard with drawer menu"),),
      drawer: DrawerMenu(),
    );
  }

  _onClickLogout() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }
}