import 'package:user_test/data/models/albums.dart';
import 'package:user_test/data/models/comments.dart';
import 'package:user_test/data/models/photos.dart';
import 'package:user_test/data/models/posts.dart';
import 'package:user_test/data/models/users.dart';

import 'network/server_api.dart';

class Repository {
  final _serverApi = ServerApi();

  Future<List<Users>> getUsers() async {
    final response = await _serverApi.getUsers();
    return response;
  }

  Future<List<Users>> getUser(int id) async {
    final response = await _serverApi.getUser(id);
    return response;
  }

  Future<List<Posts>> getPostsOfUser(int userId) async {
    final response = await _serverApi.getPostsOfUser(userId);
    return response;
  }

  Future<List<Albums>> getAlbumsOfUser(int userId) async {
    final response = await _serverApi.getAlbumsOfUser(userId);
    return response;
  }

  Future<List<Comments>> getComments(int postId) async {
    final response = await _serverApi.getComments(postId);
    return response;
  }

  Future<List<Photos>> getPhotos(int albumId) async {
    final response = await _serverApi.getPhotos(albumId);
    return response;
  }

  Future<void> postComment(int postId, String name, String email, String body) async {
    await _serverApi.postComments(postId, name, email, body);
  }
}
