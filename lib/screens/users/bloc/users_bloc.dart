import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_test/data/models/albums.dart';
import 'package:user_test/data/models/posts.dart';
import 'package:user_test/data/models/users.dart';
import 'package:user_test/data/repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    Repository repository = Repository();
    List<Users> usersList = [];
    List<Posts> postsList = [];
    List<Albums> albumsList = [];

    on<UsersListEvent>((event, emit) async {
      usersList = await repository.getUsers();
      emit(UsersListState(usersList: usersList));
    });

    on<UserInfoEvent>((event, emit) async {
      usersList = await repository.getUser(event.id);
      postsList = await repository.getPostsOfUser(event.id);
      albumsList = await repository.getAlbumsOfUser(event.id);

      emit(UserInfoState(
        user: usersList[0],
        companyIsExpanded: false,
        addressIsExpanded: false,
        postsList: postsList,
        showAllPosts: false,
        albumsList: albumsList,
        showAllAlbums: false,
      ));
    });

    on<UserInfoEvent2>((event, emit) async {
      emit(UserInfoState(
        user: event.user,
        companyIsExpanded: event.companyIsExpanded,
        addressIsExpanded: event.addressIsExpanded,
        postsList: event.postList,
        showAllPosts: event.showAllPosts,
        albumsList: event.albumList,
        showAllAlbums: event.showAllAlbums,
      ));
    });
  }
}
