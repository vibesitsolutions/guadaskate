import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_event.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_state.dart';
import 'package:guadaskate/src/models/model_helper.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class PagePage extends StatefulWidget {
  final PagesPostBloc _pagesPostBloc;

  PagePage({Key key, @required PagesPostBloc pagesPostBloc})
      : _pagesPostBloc = pagesPostBloc;

  @override
  State<PagePage> createState() {
    return PagePageState(pagesPostBloc: _pagesPostBloc);
  }
}

class PagePageState extends State<PagePage> {
  final PagesPostBloc _pagesPostBloc;

  PagePageState({@required PagesPostBloc pagesPostBloc})
      : _pagesPostBloc = pagesPostBloc;

  @override
  Widget build(BuildContext context) {
    final PagesPostBloc pagesPostBloc = BlocProvider.of<PagesPostBloc>(context);
    return BlocBuilder<PagesPostEvent, PagesPostState>(
        bloc: pagesPostBloc,
        builder: (BuildContext context, PagesPostState state) {
          if (state.error.isNotEmpty) return Text('Error: ${state.error}');
          if (state.isLoading) return _loadingIndicator();
          if (state.data != null) {
            _buildList(state.data);
          }
        });
  }

  Widget _buildList(Model model) {
    return ListView.builder(
        itemCount: model.results?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: Colors.blue,
              child: Column(children: <Widget>[
                Text(
                  model.results[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                MarkdownBody(
                    data: html2md.convert(model.results[index].content))
              ]));
        });
  }

  Widget _loadingIndicator() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.grey),
        ),
        Center(
          child: Stack(children: <Widget>[
            Text("Cargando"),
            CircularProgressIndicator()
          ]),
        ),
      ],
    );
  }
}
