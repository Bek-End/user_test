part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class PostsListEvent extends PostsEvent {
  final int userId;
  PostsListEvent({required this.userId});
}

class PostsListEvent2 extends PostsEvent {
  final List<Posts> postList;
  final bool showAll;
  PostsListEvent2({required this.postList, required this.showAll});
}

class PostInfoEvent extends PostsEvent {
  final int postId;
  PostInfoEvent({required this.postId});
}

class AddCommentEvent extends PostsEvent {
  final int postId;
  AddCommentEvent({required this.postId});
}

class PushCommentEvent extends PostsEvent {
  final int postId;
  final String name;
  final String email;
  final String body;
  PushCommentEvent({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });
}
