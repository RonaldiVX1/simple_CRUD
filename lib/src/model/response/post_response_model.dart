import 'package:pkp_test/src/model/post_model.dart';

class PostListResponseModel {
  PostListResponseModel({required this.data});

  final List<PostModel> data;

  factory PostListResponseModel.fromJson(List<dynamic> json) =>
      PostListResponseModel(
        data: List<PostModel>.from(json.map((x) => PostModel.fromJson(x))),
      );

  List<dynamic> toJson() => List<dynamic>.from(data.map((x) => x.toJson()));
}
