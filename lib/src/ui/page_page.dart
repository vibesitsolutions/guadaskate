import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
                stream: _pageBloc.outPageList,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Page>> pages) {
                  if (pages.hasData)
                    return _buildList(pages);
                  else if (pages.hasError) {
                    return Text(pages.error.toString());
                  }
                  return Center(child: LinearProgressIndicator());
                }),
          )
        ],
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<List<Page>> pages) {
    return GridView.builder(
        itemCount: pages.data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return Column(children: <Widget>[
            ListTile(title: Text(pages.data[index].title)),
            //MarkdownBody(data: html2md.convert(pages.data[index].content))
          ]);
        });
  }
}
