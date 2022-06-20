import 'package:auto_direction/auto_direction.dart';
import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:linkwell/linkwell.dart';

import '../../../core/utils/constants.dart';
import '../controllers/student_activity_controller.dart';

class StudentActivityView extends GetView<StudentActivityController> {
  StudentActivityView({Key? key}) : super(key: key);
  final String name = Get.arguments[0];
  final String image = Get.arguments[1];
  final AppServices appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Obx(
        () => (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : (controller.posts.isEmpty)
                ? const Center(child: Text('There is no Posts'))
                : NotificationListener(
                    onNotification:
                        (OverscrollIndicatorNotification notification) {
                      notification.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          shadowColor: Get.theme.primaryColor.withOpacity(0.15),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                title: name.subtitle(weight: FontWeight.bold),
                                subtitle:
                                    '${controller.posts[index].publishingDate}'
                                        .caption,
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Get.theme.colorScheme.secondary,
                                  backgroundImage:
                                      NetworkImage(Constants.baseUrl + image),
                                ),
                              ),
                              Divider(
                                height: 8,
                                endIndent: 25,
                                indent: 25,
                                thickness: 1.5,
                                color: Colors.grey.shade200,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: '${controller.posts[index].body}'
                              //       .body(),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoDirection(
                                  text: controller.posts[index].body!,
                                  child: LinkWell(
                                    controller.posts[index].body!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.3,
                                      color: (appServices.isDark.value)
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
                              if (controller.posts[index].image != null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      Constants.baseUrl +
                                          '${controller.posts[index].image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.posts.length,
                    ),
                  ),
      ),
    );
  }
}
