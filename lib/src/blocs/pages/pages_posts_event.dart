import 'package:flutter/widgets.dart';
import 'package:guadaskate/src/models/model_helper.dart';
import 'package:meta/meta.dart';

abstract class PagesPostEvent {}

class PagesPostsDataInitial extends PagesPostEvent {}

class PagesPostsDataLoading extends PagesPostEvent {
  final String type;
  final Model model;

  PagesPostsDataLoading({
    @required this.model,
    @required this.type,
  });
}
