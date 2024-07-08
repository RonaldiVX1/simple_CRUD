import 'package:flutter/material.dart';

import '../model/post_model.dart';

class CardPost extends StatelessWidget {
  PostModel postModel;

  CardPost({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              postModel.title,
              maxLines: 1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              postModel.body,
              style: TextStyle(fontSize: 14),
              maxLines: 3,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
