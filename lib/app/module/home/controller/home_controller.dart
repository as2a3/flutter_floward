import 'package:flutter_floward/app/model/post_model.dart';
import 'package:flutter_floward/app/model/user_model.dart';
import 'package:flutter_floward/app/provider/connection/handle_network_error.dart';
import 'package:flutter_floward/app/repositories/api_repository.dart';
import 'package:flutter_floward/app/service/settings_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final loading = false.obs;
  final loadingError = false.obs;
  final loadingErrorMsg = ''.obs;

  final locale = ''.obs;

  final users = <UserModel>[].obs;
  final posts = <PostModel>[].obs;

  final _apiRepository = ApiRepository();

  HomeController();

  @override
  void onInit() {
    getUsers();
    locale.value = Get.find<SettingsService>().getLocale().toString();
    super.onInit();
  }

  void changeLanguage() {
    if (locale.value == 'ar') {
      Get.find<SettingsService>().updateLocale('en');
      locale.value = 'en';
    } else {
      Get.find<SettingsService>().updateLocale('ar');
      locale.value = 'ar';
    }
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