import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({Key? key, required this.url, this.radius = 20, this.backgroundColor}) : super(key: key);

  final String url;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? Get.theme.colorScheme.secondary,
      radius: radius,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(45)),
        child: CachedNetworkImage(
          height: radius * 2,
          width: radius * 2,
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) => Image.asset(
            'assets/img/loading.gif',
            fit: BoxFit.cover,
            height: radius * 2,
            width: radius * 2,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
