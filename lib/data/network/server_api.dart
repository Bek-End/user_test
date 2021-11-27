import 'package:dio/dio.dart';
import 'package:user_test/data/models/albums.dart';
import 'package:user_test/data/models/comments.dart';
import 'package:user_test/data/models/photos.dart';
import 'package:user_test/data/models/posts.dart';
import 'package:user_test/data/models/users.dart';

class ServerApi {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
    ),
  );

  static final ServerApi _instance = ServerApi.internal();
  factory ServerApi() => _instance;
  ServerApi.internal();

  Future<List<Users>> getUsers() async {
    Response<String> response = await dio.get("/users");
    return usersFromJson(response.toString());
  }

  Future<List<Users>> getUser(int id) async {
    Response<String> response = await dio.get(
      "/users",
      queryParameters: {'id': id},
    );
    return usersFromJson(response.toString());
  }

  Future<List<Posts>> getPostsOfUser(int userId) async {
    Response<String> response = await dio.get(
      "/posts",
      queryParameters: {'userId': userId},
    );
    return postsFromJson(response.toString());
  }

  Future<List<Albums>> getAlbumsOfUser(int userId) async {
    Response<String> response = await dio.get(
      "/albums",
      queryParameters: {'userId': userId},
    );
    return albumsFromJson(response.toString());
  }

  Future<List<Comments>> getComments(int postId) async {
    Response<String> response = await dio.get(
      "/comments",
      queryParameters: {'postId': postId},
    );
    return commentsFromJson(response.toString());
  }

  Future<List<Photos>> getPhotos(int albumId) async {
    Response<String> response = await dio.get(
      "/photos",
      queryParameters: {'albumId': albumId},
    );
    return photosFromJson(response.toString());
  }

  Future<void> postComments(
      int postId, String name, String email, String body) async {
    await dio.post("/comments", queryParameters: {
      'postId': postId,
      "name": name,
      "email": email,
      "body": body,
    });
  }
}
