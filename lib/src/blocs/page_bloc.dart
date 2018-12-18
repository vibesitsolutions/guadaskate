import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../models/page_model.dart';
import '../blocs/bloc_provider.dart';
import '../resources/repository.dart';

class PageBloc extends BlocBase {
  final _repository = Repository();

  PublishSubject<List<Page>> _pageController = PublishSubject<List<Page>>();

  Sink<List<Page>> get _inPageList => _pageController.sink;

  Stream<List<Page>> get outPageList => _pageController.stream;

  fetchAllPages() async {
    PageModel pageModel = await _repository.fetchAllPages();
    _inPageList.add(pageModel.results);
  }

  PageBloc() {
    fetchAllPages();
  }

  dispose() {
    _pageController.close();
    _inPageList.close();
  }
}
