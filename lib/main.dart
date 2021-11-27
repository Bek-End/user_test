import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test/components/loading.dart';
import 'package:user_test/screens/albums/album_info_screen.dart';
import 'package:user_test/screens/albums/bloc/albums_bloc.dart';
import 'package:user_test/screens/posts/bloc/posts_bloc.dart';
import 'package:user_test/screens/users/user_info_screen.dart';

import 'screens/add_comment/add_comment_screen.dart';
import 'screens/posts/post_info_screen.dart';
import 'screens/users/bloc/users_bloc.dart';
import 'screens/users/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersBloc()..add(UsersListEvent()),
        ),
        BlocProvider(create: (context) => PostsBloc()),
        BlocProvider(create: (context) => AlbumsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Test',
        theme: ThemeData.dark(),
        home: MultiBlocListener(
          listeners: [
            BlocListener<AlbumsBloc, AlbumsState>(
              listener: (context, state) {
                if (state is AlbumInfoState) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AlbumInfoScreen(photos: state.photos),
                    ),
                  );
                }
              },
            ),
            BlocListener<PostsBloc, PostsState>(
              listener: (context, state) {
                if (state is PostInfoState) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PostInfoScreen(
                        commentsList: state.comments,
                        postId: state.postId,
                      ),
                    ),
                  );
                }
                if (state is AddCommentState) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          AddCommentScreen(postId: state.postId),
                    ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersListState) {
                return UsersScreen(userList: state.usersList);
              } else if (state is UserInfoState) {
                return UserInfoScreen(
                  user: state.user,
                  companyIsExpanded: state.companyIsExpanded,
                  addressIsExpanded: state.addressIsExpanded,
                  postList: state.postsList,
                  showAllPosts: state.showAllPosts,
                  albumList: state.albumsList,
                  showAllAlbums: state.showAllAlbums,
                );
              } else {
                return const LoadingComponent();
              }
            },
          ),
        ),
      ),
    );
  }
}
