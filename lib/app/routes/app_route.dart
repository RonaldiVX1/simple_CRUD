import 'package:get/get.dart';
import 'package:pkp_test/app/routes/route_name.dart';
import 'package:pkp_test/src/controller/home_binding.dart';
import 'package:pkp_test/src/view/add_edit_post_screen.dart';
import 'package:pkp_test/src/view/home_screen.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.addEdit,
      page: () => const AddEditPostScreen(),
      binding: HomeBinding(),
    ),
  ];
}
