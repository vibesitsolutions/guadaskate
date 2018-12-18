class PageModel {
  List<Page> _results = [];

  PageModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      Page page = Page(json[i]);
      _results.add(page);
    }
  }

  List<Page> get results => _results;
}

class Page {
  int _id;
  String _date;
  String _lastModify;
  String _title;
  String _link;
  String _content;
  String _commentStatus;
  int _author;

  Page(page) {
    _id = page['id'];
    _date = page['date'];
    _lastModify = page['modified'];
    _title = page['title']['rendered'];
    _link = page['link'];
    _content = page['content']['rendered'];
    _commentStatus = page['open'];
    _author = page['author'];
  }

  int get id => _id;

  int get author => _author;

  String get commentStatus => _commentStatus;

  String get content => _content;

  String get link => _link;

  String get title => _title;

  DateTime get lastModify => DateTime.parse(_lastModify);

  DateTime get date => DateTime.parse(_date);
}
