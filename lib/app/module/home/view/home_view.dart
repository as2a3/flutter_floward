import 'package:flutter/material.dart';
import 'package:flutter_floward/app/module/global_widget/circle_avatar_widget.dart';
import 'package:flutter_floward/app/module/global_widget/loading_error_empty_widget.dart';
import 'package:flutter_floward/app/module/home/controller/home_controller.dart';
import 'package:flutter_floward/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    super.key,
  });

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
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.user,
                    arguments: {
                      'user': controller.users[index],
                      'posts': controller.posts.value,
                    },
                  );
                },
                child: Card(
                  margin: EdgeInsets.only(
                    top: index == 0 ? 16 : 0,
                    right: 16.0,
                    left: 16.0,
                    bottom: index == controller.users.length - 1 ? 16 : 0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatarWidget(
                          radius: 35,
                          url: controller.users[index].thumbnailUrl,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.users[index].name,
                              style: Get.textTheme.button,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '${'Posts Count'.tr}: ${controller.posts.length}',
                              style: Get.textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
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
    );
  }
}
