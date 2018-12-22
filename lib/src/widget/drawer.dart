import 'package:flutter/material.dart';
import 'package:guadaskate/src/theme/main_theme.dart';
import 'package:guadaskate/src/widget/menu.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: Text("Bienvenidos Guadalajara Show",
                style: MainTheme.textStyle()),
            decoration: BoxDecoration(color: MainTheme.getMainColor()),
            padding: EdgeInsets.all(20.0),
          ),
          NavigationMenu(),
          Divider(),
          ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('Nuevas noticias', style: MainTheme.navMenuTextStyle()),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text('Foro', style: MainTheme.navMenuTextStyle()),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Iniciar Sesion', style: MainTheme.navMenuTextStyle()),
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
