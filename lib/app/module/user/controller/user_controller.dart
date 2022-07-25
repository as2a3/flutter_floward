import 'package:flutter_floward/app/model/post_model.dart';
import 'package:flutter_floward/app/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late final UserModel userModel;
  late final List<PostModel> posts;

  @override
  void onInit() {
    userModel = (Get.arguments as Map<String, dynamic>)['user'] as UserModel;
    posts = Get.arguments['posts'] as List<PostModel>;
    super.onInit();
  }
}