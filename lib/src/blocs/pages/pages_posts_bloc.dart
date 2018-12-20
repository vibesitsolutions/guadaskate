import 'dart:async';

import 'package:guadaskate/src/blocs/login/login_event.dart';
import 'package:guadaskate/src/blocs/login/login_state.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_event.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_state.dart';
import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/models/model_helper.dart';
import 'package:guadaskate/src/models/page_model.dart';
import 'package:guadaskate/src/resources/repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class PagesPostBloc extends Bloc<PagesPostEvent, PagesPostState> {
  void onPagesRefreshPressed(String type) {
    dispatch(
      PagesPostsDataInitial(),
    );
  }

  void onPagesSuccess({Model model}) {
    dispatch(PagesPostsDataLoading(model: model));
  }

  @override
  PagesPostState get initialState => PagesPostState.loading();

  @override
  Stream<PagesPostState> mapEventToState(
    PagesPostState state,
    PagesPostEvent event,
  ) async* {
    if (event is PagesPostsDataLoading) {
      yield PagesPostState.loading();

      try {
        Model model = await _getData(event.type);
        yield PagesPostState.success(model);
      } catch (error) {
        yield PagesPostState.failure(error.toString());
      }
    }

    if (event is PagesPostsDataInitial) {
      yield PagesPostState.idle();
    }
  }

  Future<Model> _getData(String type) async {
    final _repository = Repository();
    Model model;
    if (type == Global.typePage)
      model = await _repository.fetchAllPages();
    else if (type == Global.typePost) model = await _repository.fetchAllPosts();
    return model;
  }
}
