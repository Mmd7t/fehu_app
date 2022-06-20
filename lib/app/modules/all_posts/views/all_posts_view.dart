import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:fehu_app/app/modules/all_posts/widgets/posts_part.dart';
import 'package:fehu_app/app/modules/all_posts/widgets/student_activities_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/all_posts_controller.dart';

class AllPostsView extends GetView<AllPostsController> {
  AllPostsView({Key? key}) : super(key: key);
  final AppServices appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NotificationListener(
        onNotification: (OverscrollIndicatorNotification notification) {
          notification.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: Get.width,
                height: 140,
                child: LayoutBuilder(builder: (context, c) {
                  return (controller.isStudentSctivitiesLoading.value)
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor:
                                      (controller.appServices.isDark.value)
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade100,
                                  highlightColor:
                                      (controller.appServices.isDark.value)
                                          ? Colors.grey.shade900
                                          : Colors.grey.shade50,
                                  child: Container(
                                    height: c.maxHeight * 0.65,
                                    width: c.maxHeight * 0.65,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Shimmer.fromColors(
                                  baseColor:
                                      (controller.appServices.isDark.value)
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade100,
                                  highlightColor:
                                      (controller.appServices.isDark.value)
                                          ? Colors.grey.shade900
                                          : Colors.grey.shade50,
                                  child: Container(
                                    width: c.maxHeight * 0.75,
                                    height: c.maxHeight * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : (controller.studentActivities.isEmpty)
                          ? const Center(child: Text('There is no data'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.studentActivities.length,
                              itemBuilder: (context, index) =>
                                  StudentActivitiesPart(
                                data: controller.studentActivities[index],
                                height: c.maxHeight,
                              ),
                            );
                }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: 'Hello, ${appServices.name1!.value}'.subtitle(
                    color: Get.theme.primaryColor, weight: FontWeight.bold),
              ),
            ),
            (controller.isPostsLoading.value)
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        shadowColor: Get.theme.primaryColor.withOpacity(0.15),
                        child: Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: (controller.appServices.isDark.value)
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade100,
                              highlightColor:
                                  (controller.appServices.isDark.value)
                                      ? Colors.grey.shade900
                                      : Colors.grey.shade50,
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                title: Container(
                                  width: double.infinity,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                subtitle: Container(
                                  width: Get.width * 0.5,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Get.theme.colorScheme.secondary,
                                ),
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
                              padding: const EdgeInsets.all(10.0),
                              child: Shimmer.fromColors(
                                baseColor: (controller.appServices.isDark.value)
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade100,
                                highlightColor:
                                    (controller.appServices.isDark.value)
                                        ? Colors.grey.shade900
                                        : Colors.grey.shade50,
                                child: Container(
                                  width: double.infinity,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      childCount: 6,
                    ),
                  )
                : (controller.posts.isEmpty)
                    ? const SliverToBoxAdapter(child: Text('There is no Posts'))
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                            padding: EdgeInsets.only(
                                bottom: (index == controller.posts.length - 1)
                                    ? 90
                                    : 0),
                            child: PostsPart(post: controller.posts[index]),
                          ),
                          childCount: controller.posts.length,
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
