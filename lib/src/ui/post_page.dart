import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/post_bloc.dart';
import '../models/post_model.dart';

class PostPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PostPage({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final PostBloc _postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Posts")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
                stream: _postBloc.outPostList,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Post>> posts) {
                  if (posts.hasData)
                    return _buildList(posts);
                  else if (posts.hasError) {
                    return Text(posts.error.toString());
                  }
                  return Center(child: LinearProgressIndicator());
                }),
          )
        ],
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<List<Post>> posts) {
    return GridView.builder(
        itemCount: posts.data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return Column(children: <Widget>[
            Text(posts.data[index].title),
            //MarkdownBody(data: html2md.convert(posts.data[index].content))
          ]);
        });
  }
}
