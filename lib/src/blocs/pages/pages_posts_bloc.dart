import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_event.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_state.dart';
import 'package:guadaskate/src/models/model.dart';

class PagesPostBloc extends Bloc<PagesPostEvent, PagesPostState> {


  void onPagesRefreshPressed(String type) {
    dispatch(
        PagesPostsDataLoading(type: type)
    );
  }

  void onPagesSuccess({Model model}) {
    dispatch(PagesPostsDataInitial(),);
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
    Model model = await ModelFactory.getModel(type);
    return model;
  }
}
