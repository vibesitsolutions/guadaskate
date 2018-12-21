import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/ui/page_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PagePage(
      pagesPostBloc: BlocProvider.of<PagesPostBloc>(context),
    );
  }
}
