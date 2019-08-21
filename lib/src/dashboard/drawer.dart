import 'package:flutter/material.dart';
import 'package:login/src/login/screen.dart';
import 'package:login/src/utils/nav.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lucas Simon"),
              accountEmail: Text("lucassrod@gmail.com"),
            ),
            ListTile(
              onTap: () {
                print("Posts");
              },
              title: Text("Artigos"),
              leading: Icon(Icons.star),
            ),
            ListTile(
              onTap: () {
                print("Filmes");
              },
              title: Text("Item 2"),
              leading: Icon(Icons.star),
            ),
            ListTile(
              onTap: () {
                print("Configurações");
              },
              title: Text("Configurações"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              onTap: () {
                print("Ajuda");
              },
              title: Text("Ajuda"),
              leading: Icon(Icons.help),
            ),
            ListTile(
              onTap: () {
                _logout(context);
              },
              title: Text("Logout"),
              leading: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }

  void _logout(context) {
    pushReplacement(context, Login());
  }
}