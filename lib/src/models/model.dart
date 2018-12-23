import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/data_access/repository.dart';

abstract class Model<T> {
  void fromJson(dynamic json);

  List<T> get results;

  T get singleResult;
}

class ModelFactory {
  static final Repository repository = new Repository();

  static Future<Model<dynamic>> getModel(String type, [String id]) async {
    switch (type) {
      case Global.typePageList:
        return await repository.fetchAllPages();
      case Global.typePostList:
        return await repository.fetchAllPosts();
      case Global.typePage:
        assert(id != null);
        return await repository.fetchPage(id);
    }
    return null;
  }
}
