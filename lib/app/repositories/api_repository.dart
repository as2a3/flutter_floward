import 'dart:convert';

import 'package:flutter_floward/app/model/post_model.dart';
import 'package:flutter_floward/app/model/user_model.dart';
import 'package:flutter_floward/app/provider/api_client_provider.dart';
import 'package:flutter_floward/app/provider/connection/api_result.dart';
import 'package:flutter_floward/app/provider/connection/network_exceptions.dart';
import 'package:flutter_floward/app/provider/rest_client/rest_client.dart';
import 'package:get/get.dart';

const String tag = '[ApiRepository]';

class ApiRepository {
  late RestClient restClient;

  ApiRepository() {
    restClient = Get.find<ApiClient>().apiClient;
  }

  Future<ApiResult<List<UserModel>>> getUsers() async {
    try {
      return ApiResult.success(
        data: await restClient.getUsers(),
      );
    } catch (e) {
      Get.log('$tag[getUsers] $e');
      return ApiResult.failure(error: getDioException(e));
    }
  }

  Future<ApiResult<List<PostModel>>> getPosts() async {
    try {
      return ApiResult.success(
        data: await restClient.getPosts(),
      );
    } catch (e) {
      Get.log('$tag[getPosts] $e');
      return ApiResult.failure(error: getDioException(e));
    }
  }
}
