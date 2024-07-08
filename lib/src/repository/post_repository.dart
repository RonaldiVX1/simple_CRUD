import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pkp_test/src/constants/endpoint.dart';
import 'package:pkp_test/src/model/post_model.dart';
import 'package:pkp_test/src/model/response/post_response_model.dart';

class PostRepository {
  final Dio _client;

  PostRepository({required Dio client}) : _client = client;

  Future<PostListResponseModel> getPost() async {
    try {
      String endpoint = Endpoint.baseUrl;
      final responseJson = await _client.get(endpoint);

      final postList = PostListResponseModel.fromJson(responseJson.data);
      return postList;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<PostModel> createPost(String title, String body, String userId) async {
    try {
      String endpoint = Endpoint.baseUrl;
      final responseJson = await _client.post(endpoint,
          data: {"title": title, "body": body, "userId": userId});

      final post = PostModel.fromJson(responseJson.data);
      Get.printInfo(info: post.toString());
      return post;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<PostModel> updatePost(
      int id, String title, String body, String userId) async {
    try {
      String endpoint = Endpoint.baseUrl + "/$id";
      final responseJson = await _client.put(endpoint,
          data: {"id": id, "title": title, "body": body, "userId": userId});

      final post = PostModel.fromJson(responseJson.data);
      Get.printInfo(info: post.toString());
      return post;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<PostModel> deletePost(int id) async {
    try {
      String endpoint = Endpoint.baseUrl + "/$id";
      final responseJson = await _client.delete(
        endpoint,
      );

      final post = PostModel.fromJson(responseJson.data);
      Get.printInfo(info: post.toString());
      return post;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
