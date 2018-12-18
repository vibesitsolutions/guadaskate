import 'dart:async';

import '../models/post_model.dart';
import '../models/page_model.dart';
import '../rest/rest_call.dart';

class Repository {
  final restCall = RestCall();

  Future<PostModel> fetchAllPosts() => restCall.postList();

  Future<PageModel> fetchAllPages() => restCall.pageList();
}
