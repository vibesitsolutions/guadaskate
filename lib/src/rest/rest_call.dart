import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../config/globals.dart';
import '../models/post_model.dart';
import '../models/page_model.dart';

class RestCall {
  final _httpClient = new HttpClient();

  Future<PostModel> postList() async {
    String response = await _getRequest(Global.posts);
    try {
      return PostModel.fromJson(json.decode(response));
    } catch (e) {
      return null;
    }
  }

  Future<PageModel> pageList() async {
    String response = await _getRequest(Global.pages);

    try {
      return PageModel.fromJson(json.decode(response));
    } catch (e) {
      return null;
    }
  }

  Future<String> _getRequest(String type) async {
    var uri = Uri.https(Global.baseUrl, Global.apiUrl + type);

    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return response.transform(utf8.decoder).join();
  }
}
