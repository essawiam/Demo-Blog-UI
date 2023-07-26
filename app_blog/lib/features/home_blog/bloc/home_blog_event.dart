part of 'home_blog_bloc.dart';

@immutable
abstract class HomeBlogEvent {}

class HomeBlogItemsFetched extends HomeBlogEvent {}

class HomeBlogItemUpdated extends HomeBlogEvent {
  final HomeBlogModel homeBlogModel;

  HomeBlogItemUpdated({required this.homeBlogModel});
}
