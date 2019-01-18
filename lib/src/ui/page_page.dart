import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_event.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_state.dart';
import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/lang/lang_localizations.dart';
import 'package:guadaskate/src/models/model.dart';

class PagePage extends StatefulWidget {

  @override
  State<PagePage> createState() {
    return PagePageState();
  }
}

class PagePageState extends State<PagePage> {
  final PagesPostBloc _pagesPostBloc = PagesPostBloc();

  PagePageState(){
    _pagesPostBloc.onGetPage(Global.typePage, "sample-page");
  }

  @override
  Widget build(BuildContext context) {
    print("PagePage - ${Localizations.localeOf(context).toString()}");
    return BlocBuilder<PagesPostEvent, PagesPostState>(
        bloc: _pagesPostBloc,
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
      child: Text(
        LangLocalizations.of(context).body,
      ),
    );
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
