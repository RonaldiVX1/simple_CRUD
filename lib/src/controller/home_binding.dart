import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pkp_test/src/controller/home_controller.dart';
import 'package:pkp_test/src/repository/post_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostRepository(
      client: Get.find<Dio>(),
    ));

    Get.put(HomeController(
      postRepository: Get.find<PostRepository>(),
    ));
  }
}
