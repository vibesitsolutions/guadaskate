import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../config/globals.dart';
import '../models/page_model.dart';
import '../models/post_model.dart';

class RestCall {
  final _httpClient = new HttpClient();

  Future<PostModel> postList() async {
    String response = await _getRequest(global.postList);
    Map<String, dynamic> responseData = json.decode(response);
    if (responseData["status"] != "ok") {
      print("Data returned error: ${responseData["error"]}");
    }
    return PostModel.fromJson(responseData["posts"]);
  }

  Future<PageModel> pageList() async {
    String response = await _getRequest(global.pageList);
    Map<String, dynamic> responseData = json.decode(response);
    if (responseData["status"] != "ok") {
      print("Data returned error: ${responseData["error"]}");
    }
    return PageModel.fromJson(responseData["pages"]);
  }

  Future<String> homePage() async {
    return await _getRequest(global.mainPage);
  }

  Future<PageModel> getPage(String id) async {
    String response = await _getRequest(global.page, getParams: {"slug": id});
    Map<String, dynamic> responseData = json.decode(response);
    if (responseData["status"] != "ok") {
      print("Data returned error: ${responseData["error"]}");
    }
    return PageModel.fromJson(responseData["page"]);
  }

  Future<String> _getRequest(String type,
      {Map<String, String> getParams}) async {
    var uri = Uri.https(global.baseUrl, global.apiUrl + type, getParams);
    print(uri);
    var request = await _httpClient.getUrl(uri);
    request.headers.add("Accept", "application/json");
    var response = await request.close();
    var utf8content = response.transform(utf8.decoder).join();
    print(utf8content);
    return utf8content;
  }
}
