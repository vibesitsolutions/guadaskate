import 'dart:async';

import 'package:guadaskate/src/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../models/post_model.dart';
import '../resources/repository.dart';

class PostBloc extends BlocBase {
  final _repository = Repository();

  PublishSubject<List<Post>> _postController = PublishSubject<List<Post>>();

  Sink<List<Post>> get _inPostList => _postController.sink;

  Stream<List<Post>> get outPostList => _postController.stream;

  fetchAllPost() async {
    PostModel postModel = await _repository.fetchAllPosts();
    _inPostList.add(postModel.results);
  }

  PostBloc() {
    fetchAllPost();
  }

  dispose() {
    _postController.close();
    _inPostList.close();
  }
}
