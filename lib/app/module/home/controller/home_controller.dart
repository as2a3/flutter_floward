import 'package:flutter_floward/app/model/post_model.dart';
import 'package:flutter_floward/app/model/user_model.dart';
import 'package:flutter_floward/app/provider/connection/handle_network_error.dart';
import 'package:flutter_floward/app/repositories/api_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final loading = false.obs;
  final loadingError = false.obs;
  final loadingErrorMsg = ''.obs;

  final users = <UserModel>[].obs;
  final posts = <PostModel>[].obs;

  final _apiRepository = ApiRepository();

  HomeController();

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  /// ------------------------------- APIs -------------------------------------
  Future<void> getUsers() async {
    loading.value = true;
    final response = await _apiRepository.getUsers();
    response.when(
      success: (list) {
        users.assignAll(list.toSet().toList());
        getPosts();
      },
      failure: (error) {
        handleAPIErrorUI(
          error,
          showMessage: false,
          fail: (msg) {
            loading.value = false;
            loadingError.value = true;
            loadingErrorMsg.value = msg;
          },
        );
      },
    );
  }

  Future<void> getPosts() async {
    loading.value = true;
    final response = await _apiRepository.getPosts();
    response.when(
      success: (list) {
        posts.assignAll(list.toSet().toList());

        /// UI
        loading.value = false;
        loadingError.value = false;
        loadingErrorMsg.value = '';
      },
      failure: (error) {
        handleAPIErrorUI(
          error,
          showMessage: false,
          fail: (msg) {
            loading.value = false;
            loadingError.value = true;
            loadingErrorMsg.value = msg;
          },
        );
      },
    );
  }

}