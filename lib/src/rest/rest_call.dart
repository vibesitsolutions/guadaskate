import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:guadaskate/src/models/model_helper.dart';

import '../config/globals.dart';
import '../models/page_model.dart';
import '../models/post_model.dart';

class RestCall {
  final _httpClient = new HttpClient();

  Future<Model> postList() async {
    String response = await _getRequest(Global.posts);
    Map<String, dynamic> responseData = json.decode(response);
    if (responseData["status"] != "ok") {
      print("Data returned error: ${responseData["error"]}");
    }
    return PostModel.fromJson(responseData["posts"]);
  }

  Future<Model> pageList() async {
    String response = await _getRequest(Global.posts);
    Map<String, dynamic> responseData = json.decode(response);
    if (responseData["status"] != "ok") {
      print("Data returned error: ${responseData["error"]}");
    }
    return PostModel.fromJson(responseData["pages"]);
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
