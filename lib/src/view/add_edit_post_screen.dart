import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_test/src/controller/home_controller.dart';

class AddEditPostScreen extends GetView<HomeController> {
  const AddEditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Detail"), actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              controller.deletePost(controller.selectedPostId);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text("Post Deleted, Check LOG"),
              ));
              Get.back();
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 32,
            ),
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                child: TextField(
                  controller: controller.etTitle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'title',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                child: TextField(
                  controller: controller.etDescription,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "User Id",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                child: TextField(
                  controller: controller.etUserId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id',
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  controller.selectedPost != null
                      ? controller.updatePost(controller.selectedPostId)
                      : controller.createPost();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: controller.selectedPost != null
                        ? Colors.blue
                        : Colors.green,
                    content: Text(controller.selectedPost != null
                        ? "Updated, Check LOG"
                        : "Post created, Check LOG"),
                  ));
                  Get.back();
                },
                child: Container(
                    color: Colors.blueAccent,
                    height: 70,
                    child: Center(
                      child: Text(
                        controller.selectedPost != null
                            ? "Update"
                            : "Create Post",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
