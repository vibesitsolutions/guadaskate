import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../config/globals.dart';
import '../models/page_model.dart';
import '../models/post_model.dart';

class RestCall {
  final _httpClient = new HttpClient();

  Future<PostModel> postList() async {
    String response = await _getRequest(Global.posts);
    return PostModel.fromJson(json.decode(response));
  }

  Future<PageModel> pageList() async {
    String response = await _getRequest(Global.pages);
    return PageModel.fromJson(json.decode(response));
  }

  Future<String> _getRequest(String type) async {
    var uri = Uri.https(Global.baseUrl, Global.apiUrl + type, {"_embed": ""});
    print(uri);
    var request = await _httpClient.getUrl(uri);
    request.headers.add("Accept", "application/json");
    var response = await request.close();
    var utf8content = response.transform(utf8.decoder).join();
    print(utf8content);
    return utf8content;
  }
}
