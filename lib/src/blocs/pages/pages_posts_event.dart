import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

abstract class PagesPostEvent {}

class PagesPostsNoData extends PagesPostEvent {}

class PagesPostsDataLoading extends PagesPostEvent {
  final String type;
  final String id;

  PagesPostsDataLoading({@required this.type, this.id});
}
