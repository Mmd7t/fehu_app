import 'package:fehu_app/app/data/models/all_student_activities_model/student_activity.dart';
import 'package:fehu_app/app/modules/all_posts/controllers/all_posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../student_activity/controllers/student_activity_controller.dart';

class StudentActivitiesPart extends GetView<AllPostsController> {
  final StudentActivity? data;
  final double? height;
  const StudentActivitiesPart({Key? key, this.data, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.put(StudentActivityController()).fetchSAPosts(data!.id!);
        Get.toNamed(Routes.studentActivity,
            arguments: [data!.name, data!.image]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height! * 0.65,
              width: height! * 0.65,
              decoration: BoxDecoration(
                color: (controller.appServices.isDark.value)
                    ? Colors.grey.shade900
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(Constants.baseUrl + data!.image!),
                ),
              ),
              padding: const EdgeInsets.all(2),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: (controller.appServices.isDark.value)
                    ? Colors.grey.shade800
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              width: height! * 0.75,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Text(
                '${data!.name}',
                style: Get.textTheme.bodyText1!.copyWith(
                  color: (controller.appServices.isDark.value)
                      ? Colors.white
                      : Get.theme.colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
