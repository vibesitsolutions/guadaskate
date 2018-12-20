abstract class Model<T> {
  void fromJson(List json);

  List<T> get results;
}
