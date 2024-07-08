import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_test/app/routes/route_name.dart';
import 'package:pkp_test/src/controller/home_controller.dart';
import 'package:pkp_test/src/widgets/card_post.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post App"),
      ),
      body: Obx(
        () => (controller.isLoadingRetrieveProduct == true)
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.post.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectPost(controller.post[index]);
                      Get.toNamed(RouteName.addEdit);
                    },
                    child: CardPost(
                      postModel: controller.post[index],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(RouteName.addEdit);
            controller.clearText();
          },
          label: Row(
            children: [
              Icon(Icons.add),
              SizedBox(width: 10),
              Text("Create"),
            ],
          )),
    );
  }
}
