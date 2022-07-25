import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

bool get kIsWeb => identical(0, 0.0);
bool get isMobile => Get.width < 768;
bool get isTablet => Get.width < 1280 && Get.width >= 768;
bool get isDesktop => Get.width >= 1280;

String get currentPlatform => GetPlatform.isWeb ? 'web' : GetPlatform.isIOS ? 'ios' : 'android';

void hideKeyboard() => FocusScope.of(Get.context!).requestFocus(FocusNode());

void hideGetDialog() => Get.isDialogOpen! ? Get.back() : () {};

void showToastMessage({
  String message = '',
  Toast length = Toast.LENGTH_SHORT,
  ToastGravity position = ToastGravity.BOTTOM,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: position,
    backgroundColor: Get.theme.colorScheme.secondary,
    textColor: Get.theme.primaryColor,
    fontSize: 16.0,
  );
}

Color parseColor(String hexCode, {double opacity = 1}) {
  try {
    return Color(int.parse(hexCode.replaceAll('#', '0xFF')))
        .withOpacity(opacity);
  } catch (e) {
    return const Color(0xFFCCCCCC).withOpacity(opacity);
  }
}

BoxDecoration getBoxDecoration({
  Color? color,
  double radius = 10,
  Border? border,
  Gradient? gradient,
  List<BoxShadow>? boxShadow,
  BorderRadiusGeometry? borderRadius,
}) {
  return BoxDecoration(
    color: color ?? Get.theme.primaryColor,
    borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
    boxShadow: boxShadow ??
        [
          BoxShadow(
            color: Get.theme.focusColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
    border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
    gradient: gradient,
  );
}

InputDecoration getInputDecoration({
  String hintText = '',
  String? errorText,
  IconData? iconData,
  Color? iconColor,
  Widget? suffixIcon,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: Get.textTheme.caption,
    prefixIcon: iconData != null
        ? Icon(iconData, color: iconColor ?? Get.theme.focusColor)
            .marginOnly(right: 14)
        : const SizedBox(),
    prefixIconConstraints: iconData != null
        ? const BoxConstraints.expand(width: 38, height: 38)
        : const BoxConstraints.expand(width: 0, height: 0),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.zero,
    border: const OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    suffixIcon: suffixIcon,
    suffix: suffix,
    errorText: errorText,
  );
}
