import 'package:flutter_floward/app/module/home/binding/home_binding.dart';
import 'package:flutter_floward/app/module/home/view/home_view.dart';
import 'package:flutter_floward/app/routes/app_routes.dart';
import 'package:get/get.dart' show GetPage;

const initialRout = Routes.home;
final routes = [
  GetPage(
    name: Routes.home,
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
];
