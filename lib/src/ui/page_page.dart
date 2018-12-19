import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../blocs/bloc_provider.dart';
import '../blocs/page_bloc.dart';
import '../models/page_model.dart';

class PagePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PagePage({Key key, @required this.page}) : super(key: key);

  final Page page;

  @override
  Widget build(BuildContext context) {
    final PageBloc _pageBloc = BlocProvider.of<PageBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Pages")),
      body: Container(
        child: StreamBuilder(
            stream: _pageBloc.outPageList,
            builder: (BuildContext context, AsyncSnapshot<List<Page>> snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Select lot');
                case ConnectionState.waiting:
                  return Center(child: LinearProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  return _buildList(snapshot);
              }
            }),
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<List<Page>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: Colors.blue,
              child: Column(children: <Widget>[
                Text(
                  snapshot.data[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                MarkdownBody(data: html2md.convert(snapshot.data[index].content))
              ]));
        });
  }
}
