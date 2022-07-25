import 'package:flutter/material.dart';
import 'package:flutter_floward/app/module/global_widget/circle_avatar_widget.dart';
import 'package:flutter_floward/app/module/global_widget/loading_error_empty_widget.dart';
import 'package:flutter_floward/app/module/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Floward App'.tr,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return LoadingErrorEmptyWidget(
          isLoading: controller.loading.value,
          isLoadingError: controller.loadingError.value,
          errorText: controller.loadingErrorMsg.value,
          retryAction: controller.getUsers,
          child: ListView.separated(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      CircleAvatarWidget(url: controller.users[index].thumbnailUrl,),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getUsers,
        child: const Icon(Icons.add),
      ),
    );
  }
}
