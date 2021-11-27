import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_test/data/models/albums.dart';
import 'package:user_test/data/models/posts.dart';
import 'package:user_test/data/models/users.dart';
import 'package:user_test/screens/albums/bloc/albums_bloc.dart';
import 'package:user_test/screens/posts/bloc/posts_bloc.dart';

import 'bloc/users_bloc.dart';

class UserInfoScreen extends StatelessWidget {
  final Users user;
  final bool companyIsExpanded;
  final bool addressIsExpanded;
  final List<Posts> postList;
  final bool showAllPosts;
  final List<Albums> albumList;
  final bool showAllAlbums;
  const UserInfoScreen({
    Key? key,
    required this.user,
    required this.companyIsExpanded,
    required this.addressIsExpanded,
    required this.postList,
    required this.showAllPosts,
    required this.albumList,
    required this.showAllAlbums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        context.read<UsersBloc>().add(UsersListEvent());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(user.username),
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            children: [
              Text(user.name),
              Text(user.email),
              Text(user.phone),
              Text(user.website),
              const SizedBox(height: 15),
              ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    context.read<UsersBloc>().add(
                          UserInfoEvent2(
                            user: user,
                            companyIsExpanded: index == 0
                                ? !companyIsExpanded
                                : companyIsExpanded,
                            addressIsExpanded: index == 1
                                ? !addressIsExpanded
                                : addressIsExpanded,
                            postList: postList,
                            showAllPosts: showAllPosts,
                            albumList: albumList,
                            showAllAlbums: showAllAlbums,
                          ),
                        );
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: companyIsExpanded,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const ListTile(
                          title: Text("Company"),
                        );
                      },
                      body: ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.company.name),
                              Text(user.company.bs),
                              Text(
                                user.company.catchPhrase,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                            ]),
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: addressIsExpanded,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const ListTile(
                          title: Text("Address"),
                        );
                      },
                      body: ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.address.city),
                              Text(user.address.street),
                              Text(user.address.suite),
                              Text(user.address.zipcode),
                              Text(
                                  "lat: ${user.address.geo.lat}; lng: ${user.address.geo.lng}"),
                            ]),
                      ),
                    ),
                  ]),
              const SizedBox(height: 15),
              SizedBox(
                width: size.width,
                height: 120,
                child: PageView(
                  children: List.generate(
                    showAllPosts ? postList.length : 3,
                    (index) => ListTile(
                      title: Text(postList[index].title),
                      subtitle: Text(postList[index].body),
                      trailing: Text("${index + 1}/${postList.length}"),
                      onTap: () {
                        BlocProvider.of<PostsBloc>(context).add(
                          PostInfoEvent(postId: postList[index].id),
                        );
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: showAllPosts
                    ? null
                    : () {
                        context.read<UsersBloc>().add(
                              UserInfoEvent2(
                                user: user,
                                companyIsExpanded: companyIsExpanded,
                                addressIsExpanded: addressIsExpanded,
                                postList: postList,
                                showAllPosts: !showAllPosts,
                                albumList: albumList,
                                showAllAlbums: showAllAlbums,
                              ),
                            );
                      },
                child: const Text("Show all"),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: size.width,
                height: 60,
                child: PageView(
                  children: List.generate(
                    showAllAlbums ? albumList.length : 3,
                    (index) => ListTile(
                      title: Text(albumList[index].title),
                      trailing: Text("${index + 1}/${albumList.length}"),
                      onTap: () {
                        BlocProvider.of<AlbumsBloc>(context).add(
                          AlbumInfoEvent(albumId: albumList[index].id),
                        );
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: showAllAlbums
                    ? null
                    : () {
                        context.read<UsersBloc>().add(
                              UserInfoEvent2(
                                user: user,
                                companyIsExpanded: companyIsExpanded,
                                addressIsExpanded: addressIsExpanded,
                                postList: postList,
                                showAllPosts: showAllPosts,
                                albumList: albumList,
                                showAllAlbums: !showAllAlbums,
                              ),
                            );
                      },
                child: const Text("Show all"),
              )
            ]),
      ),
    );
  }
}
