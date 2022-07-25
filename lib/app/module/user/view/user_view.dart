import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floward/app/module/user/controller/user_controller.dart';
import 'package:get/get.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Get.theme.primaryColor),
        title: Text(
          'User Details'.tr,
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.theme.colorScheme.secondary,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                elevation: 0,
                centerTitle: true,
                expandedHeight: 250.0,
                automaticallyImplyLeading: false,
                forceElevated: innerBoxIsScrolled,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Get.theme.scaffoldBackgroundColor,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: CachedNetworkImage(
                      imageUrl: controller.userModel.url,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.separated(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: index == controller.posts.length - 1 ? 16 : 0,
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      controller.posts[index].title,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline5,
                    ),
                    const SizedBox(height: 12,),
                    Text(
                      controller.posts[index].body,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline6,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
