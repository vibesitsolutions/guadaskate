import 'dart:async';

import '../models/post_model.dart';
import '../models/page_model.dart';
import '../data_access/rest_call.dart';

class Repository {
  final restCall = RestCall();

  Future<PostModel> fetchAllPosts() => restCall.postList();

  Future<PageModel> fetchAllPages() => restCall.pageList();

  Future<String> fetchMainPage() => restCall.homePage();

}

