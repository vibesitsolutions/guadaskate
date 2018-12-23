import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_event.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_state.dart';
import 'package:guadaskate/src/models/model.dart';
import 'package:flutter_html/flutter_html.dart';

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
          if (state.isError) {
            return Text("An error has ocurred");
          }
          if (state.isLoading) {
            return _loadingIndicator();
          }

          if (state.isSuccess) {
            return _buildList(state.data);
          }
        });
  }

  Widget _buildList(Model model) {
    return Container(
        child: Html(
      data: model.singleResult.content,
    ));
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
