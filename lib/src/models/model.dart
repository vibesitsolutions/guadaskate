import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/data_access/repository.dart';

abstract class Model<T> {
  void fromJson(List json);

  List<T> get results;

}

class ModelFactory {

  static final Repository repository = new Repository();

  static Future<Model<dynamic>> getModel(String type, {int id}) async{
    switch(type){
      case Global.typePageList:
        return await repository.fetchAllPages();
      case Global.typePostList:
        return await repository.fetchAllPosts();
    }
    return null;
  }
}
