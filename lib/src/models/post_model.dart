import 'package:guadaskate/src/models/model.dart';

class PostModel extends Model<Post> {
  List<Post> _results = [];

  PostModel.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  void fromJson(dynamic json) {
    for (int i = 0; i < json.length; i++) {
      Post post = Post(json[i]);
      _results.add(post);
    }
  }

  List<Post> get results => _results;

  Post get singleResult => null; //TODO: Apply same model than page
}

class Post {
  int _id;
  String _date;
  String _lastModify;
  String _title;
  String _link;
  String _content;
  String _commentStatus;

  Post(post) {
    _id = post['id'];
    _date = post['date'];
    _lastModify = post['modified'];
    _title = post['title']['rendered'];
    _link = post['link'];
    _content = post['content']['rendered'];
    _commentStatus = post['open'];
  }

  int get id => _id;

  String get commentStatus => _commentStatus;

  String get content => _content;

  String get link => _link;

  String get title => _title;

  DateTime get lastModify => DateTime.parse(_lastModify);

  DateTime get date => DateTime.parse(_date);
}
