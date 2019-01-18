import 'package:flutter/material.dart';

class Global {
  final baseUrl = "thisisatest.cloudaccess.host";

  //static const baseUrl => "patinajeguadalajara.com";
  final apiUrl = "/api/";

  final String pageList = "get_page_index";
  final String postList = "get_posts";

  final String page = "get_page";
  final String post = "get_post";

  final String mainPage = "";

  static const typePageList = "pageList";
  static const typePostList = "postList";
  static const typePage = "page";
  static const typePost = "post";
  static const typeMainPage = "mainPage";

  // Locales
  final List<String> supportedLocales = ["en", "es"];

  // Singleton instantiation
  static final Global _global = new Global._internal();

  factory Global(){
    return _global;
  }

  Global._internal();
}

Global global = new Global();