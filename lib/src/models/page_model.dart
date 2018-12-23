import 'package:guadaskate/src/models/model.dart';

class PageModel extends Model<Page> {
  List<Page> _results = [];
  Page _singleResult;

  PageModel.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  void fromJson(dynamic json) {
    if (json is List) {
      for (int i = 0; i < json.length; i++) {
        Page page = Page(json[i]);
        _results.add(page);
      }
    }
    if (json is Map) {
      _singleResult = Page(json);
    }
  }

  Page get singleResult => _singleResult;

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
