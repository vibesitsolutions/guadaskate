import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

abstract class PagesPostEvent {}

class PagesPostsDataInitial extends PagesPostEvent {}

class PagesPostsDataLoading extends PagesPostEvent {
  final String type;

  PagesPostsDataLoading({
    @required this.type,
  });
}
