import 'package:guadaskate/src/models/model.dart';

class PageModel extends Model<Page> {
  List<Page> _results = [];

  PageModel.fromJson(List json) {
    fromJson(json);
  }

  @override
  void fromJson(List json) {
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
  String _url;
  String _content;
  String _commentStatus;

  Page(page) {
    _id = page['id'];
    _date = page['date'];
    _lastModify = page['modified'];
    _title = page['title_plain'];
    _url = page['url'];
    _content = page['excerpt'];
  }

  int get id => _id;

  String get commentStatus => _commentStatus;

  String get content => _content;

  String get link => _url;

  String get title => _title;

  DateTime get lastModify => DateTime.parse(_lastModify);

  DateTime get date => DateTime.parse(_date);
}
