class Global {
  static const baseUrl = "thisisatest.cloudaccess.host";
  //static const baseUrl => "patinajeguadalajara.com";
  static const apiUrl = "/api/";

  static String get pageList => "get_page_index";
  static String get postList => "get_posts";
  static String getPage(String id) => "get_page/$id";
  static String getPost(String id) => "get_post/$id";
  static String get mainPage => "";

  static const typePageList = "pageList";
  static const typePostList = "postList";
  static const typePage = "page";
  static const typePost = "post";
  static const typeMainPage = "mainPage";

}
