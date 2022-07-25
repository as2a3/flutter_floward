import 'package:dio/dio.dart';
import 'package:flutter_floward/app/model/post_model.dart';
import 'package:flutter_floward/app/model/user_model.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://my-json-server.typicode.com/SharminSirajudeen/test_resources/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('users')
  Future<List<UserModel>> getUsers();

  @GET('posts')
  Future<List<PostModel>> getPosts();
}
