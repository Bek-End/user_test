part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsListState extends PostsState {
  final List<Posts> postsList;
  final bool showAll;
  PostsListState({required this.postsList, required this.showAll});
}

class PostInfoState extends PostsState {
  final int postId;
  final List<Comments> comments;
  PostInfoState({required this.postId, required this.comments});
}

class AddCommentState extends PostsState {
  final int postId;
  AddCommentState({required this.postId});
}
