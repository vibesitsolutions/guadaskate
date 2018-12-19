import 'package:flutter/material.dart';
import 'package:guadaskate/src/blocs/bloc_provider.dart';
import 'package:guadaskate/src/blocs/page_bloc.dart';
import 'package:guadaskate/src/blocs/post_bloc.dart';
import 'package:guadaskate/src/ui/page_page.dart';
import 'package:guadaskate/src/ui/post_page.dart';
import 'package:guadaskate/src/widget/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guadalajara Show 2018')),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Page List'),
              onPressed: () {
                _openPage(context);
              },
            ),
            RaisedButton(
              child: Text('Post List'),
              onPressed: () {
                _openPost(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openPost(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<PostBloc>(
        bloc: PostBloc(),
        child: PostPage(),
      );
    }));
  }

  void _openPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<PageBloc>(
        bloc: PageBloc(),
        child: PagePage(),
      );
    }));
  }
}
