import 'package:flutter/material.dart';
import 'package:guadaskate/src/theme/main_theme.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          Container(
            child: Text("Bienvenidos Guadalajara Show",
                style: MainTheme.textStyle()),
            decoration: BoxDecoration(color: Colors.pink),
            padding: EdgeInsets.all(20.0),
          ),
          ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('Nuevas noticias'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text('Foro'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Iniciar Sesion'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
        ],
      ),
    );
  }
}
