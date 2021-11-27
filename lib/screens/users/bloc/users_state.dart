part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersListState extends UsersState {
  final List<Users> usersList;
  UsersListState({required this.usersList});
}

class UserInfoState extends UsersState {
  final Users user;
  final bool companyIsExpanded;
  final bool addressIsExpanded;
  final List<Posts> postsList;
  final bool showAllPosts;
  final List<Albums> albumsList;
  final bool showAllAlbums;
  UserInfoState({
    required this.user,
    required this.companyIsExpanded,
    required this.addressIsExpanded,
    required this.postsList,
    required this.showAllPosts,
    required this.albumsList,
    required this.showAllAlbums,
  });
}
