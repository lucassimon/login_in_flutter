import 'package:flutter/material.dart';

import 'package:login/src/login/screen.dart';

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
      ),
      body: Container(child: Text("render the dashboard with drawer menu"),),
      floatingActionButton: FloatingActionButton(
        onPressed: _logout,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }

  _logout() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }
}