import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final String username, mail;

  MyDrawer({
    Key key,
    @required this.username,
    @required this.mail,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          _isLogged
              ? UserAccountsDrawerHeader(
                  accountName: Text(widget.mail ?? ""),
                  accountEmail: Text(widget.username ?? "Invitado"),
                  currentAccountPicture:
                      CircleAvatar(child: Text(widget.username.substring(0, 1) ?? "I"), backgroundColor: Colors.white, radius: 10.0),
                  decoration: BoxDecoration(color: Colors.pink))
              : Container(),
          ListTile(
            title: Text('Ver posts'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            title: Text('Ver paginas'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            title: Text('Foro'),
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
