part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class UsersListEvent extends UsersEvent {}

class UserInfoEvent extends UsersEvent {
  final int id;
  UserInfoEvent({required this.id});
}

class UserInfoEvent2 extends UsersEvent {
  final Users user;
  final bool companyIsExpanded;
  final bool addressIsExpanded;
  final List<Posts> postList;
  final bool showAllPosts;
  final List<Albums> albumList;
  final bool showAllAlbums;
  UserInfoEvent2({
    required this.user,
    required this.companyIsExpanded,
    required this.addressIsExpanded,
    required this.postList,
    required this.showAllPosts,
    required this.albumList,
    required this.showAllAlbums,
  });
}
