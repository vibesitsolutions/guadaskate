import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_event.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_state.dart';
import 'package:guadaskate/src/models/model.dart';

class PagesPostBloc extends Bloc<PagesPostEvent, PagesPostState> {
  void onGetPage(String type, String id) {
    dispatch(PagesPostsDataLoading(type: type, id: id));
  }

  void onPagesSuccess({Model model}) {
    dispatch(
      PagesPostsNoData(),
    );
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
        Model model = await _getData(event.type, event.id);
        yield PagesPostState.success(model);
      } catch (error) {
        print(error);
        yield PagesPostState.failure(error.toString());
      }
    }

    if (event is PagesPostsNoData) {
      yield PagesPostState.idle();
    }
  }

  Future<Model> _getData(String type, String id) async {
    Model model = await ModelFactory.getModel(type, id);
    return model;
  }
}
