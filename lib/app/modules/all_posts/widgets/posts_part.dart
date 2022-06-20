import 'package:auto_direction/auto_direction.dart';
import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/data/models/all_posts_model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkwell/linkwell.dart';
import '../../../core/utils/constants.dart';
import '../controllers/all_posts_controller.dart';

class PostsPart extends GetView<AllPostsController> {
  final Post? post;
  const PostsPart({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      shadowColor: Get.theme.primaryColor.withOpacity(0.15),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: '${post!.studentActivity!.name}'.subtitle(
                weight: FontWeight.bold,
                color: (controller.appServices.isDark.value)
                    ? Colors.white
                    : Get.theme.primaryColor),
            subtitle: '${post!.publishingDate}'.caption,
            leading: CircleAvatar(
              backgroundColor: Get.theme.colorScheme.secondary,
              backgroundImage: NetworkImage(
                  Constants.baseUrl + '${post!.studentActivity!.image}'),
            ),
          ),
          Divider(
            height: 8,
            endIndent: 25,
            indent: 25,
            thickness: 1.5,
            color: (controller.appServices.isDark.value)
                ? Colors.grey.shade800
                : Colors.grey.shade200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoDirection(
              text: post!.body!,
              child: LinkWell(
                post!.body!,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  color: (controller.appServices.isDark.value)
                      ? Colors.white
                      : Colors.black,
                ),
                linkStyle: TextStyle(
                  height: 1.3,
                  color: Colors.blue[300],
                  decoration: TextDecoration.underline,
                ),
                // textAlign: TextAlign.justify,
              ),
            ),
          ),
          if (post!.image != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  Constants.baseUrl + '${post!.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
