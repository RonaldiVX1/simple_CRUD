import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_test/src/model/post_model.dart';
import 'package:pkp_test/src/repository/post_repository.dart';

class HomeController extends GetxController {
  final PostRepository _postRepository;

  HomeController({required PostRepository postRepository})
      : _postRepository = postRepository;

  final etTitle = TextEditingController();
  final etDescription = TextEditingController();
  final etUserId = TextEditingController();

  final _post = Rx<List<PostModel>>([]);

  List<PostModel> get post => _post.value;

  final _isLoadingRetrieveData = false.obs;

  bool get isLoadingRetrieveProduct => _isLoadingRetrieveData.value;

  final _selectedPost = Rxn<PostModel>();

  get selectedPost => _selectedPost.value;

  final _selectedPostId = 0.obs;

  get selectedPostId => _selectedPostId.value;

  @override
  void onInit() {
    getPost();

    super.onInit();
  }

  void getPost() async {
    _isLoadingRetrieveData.value = true;
    try {
      final listPost = await _postRepository.getPost();

      _post.value = listPost.data;
    } catch (error) {
      Get.printInfo(info: error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void createPost() async {
    _isLoadingRetrieveData.value = true;
    try {
      final createPost = await _postRepository.createPost(
          etTitle.text, etDescription.text, etUserId.text);
    } catch (error) {
      Get.printInfo(info: error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void updatePost(int id) async {
    _isLoadingRetrieveData.value = true;
    try {
      final upatePost = await _postRepository.updatePost(
          id, etTitle.text, etDescription.text, etUserId.text);
    } catch (error) {
      Get.printInfo(info: error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void deletePost(int id) async {
    _isLoadingRetrieveData.value = true;
    try {
      final deletePost = await _postRepository.deletePost(id);
    } catch (error) {
      Get.printInfo(info: error.toString());
    }
    _isLoadingRetrieveData.value = false;
  }

  void clearText() {
    etTitle.clear();
    etDescription.clear();
    etUserId.clear();
    _selectedPost.value = null;
  }

  void selectPost(PostModel data) {
    _selectedPost.value = data;
    _selectedPostId.value = data.id;
    etTitle.text = data.title;
    etDescription.text = data.body;
    etUserId.text = data.userId.toString();
  }
}
