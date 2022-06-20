import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/tables_drives_controller.dart';

class TablesDrivesView extends GetView<TablesDrivesController> {
  const TablesDrivesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: 'Drives'.title(),
                ),
              ),
            ),
            (controller.appServices.drives.isNotEmpty)
                ? SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.folder_fill,
                            color: Get.theme.colorScheme.secondary,
                          ),
                          title: (index == 0)
                              ? 'Prep. Drive'.subtitle(
                                  color: Colors.grey, weight: FontWeight.bold)
                              : 'Drive $index'.subtitle(
                                  color: Colors.grey, weight: FontWeight.bold),
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                controller.appServices.drives[index]!))) {
                              Get.snackbar('Error', 'Could not open link',
                                  backgroundColor: Colors.red);
                            }
                          },
                        ),
                      ),
                      childCount: controller.appServices.drives
                          .where((e) => e!.isNotEmpty)
                          .length,
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: Center(
                      child: Text('No Drives'),
                    ),
                  ),
            const SliverPadding(padding: EdgeInsets.all(12)),
            SliverToBoxAdapter(
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: 'Table'.title(),
                ),
              ),
            ),
            (controller.isTableLoading.value)
                ? const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()))
                : (controller.tableData.isEmpty)
                    ? const SliverToBoxAdapter(
                        child: Center(child: Text('No Data')))
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                'Day: '.body(),
                                                '${controller.tableData[index].day}'
                                                    .subtitle(
                                                        weight: FontWeight.bold,
                                                        color: (controller
                                                                .appServices
                                                                .isDark
                                                                .value)
                                                            ? Get
                                                                .theme
                                                                .colorScheme
                                                                .secondary
                                                            : Get.theme
                                                                .primaryColor),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                'Subject: '.body(
                                                    color: (controller
                                                            .appServices
                                                            .isDark
                                                            .value)
                                                        ? Get.theme.colorScheme
                                                            .secondary
                                                        : Get.theme
                                                            .primaryColor),
                                                '${controller.tableData[index].subject}'
                                                    .body(
                                                        weight:
                                                            FontWeight.bold),
                                              ],
                                            ),
                                          ],
                                        ),
                                        '${controller.tableData[index].startTime} - ${controller.tableData[index].endTime}'
                                            .body(weight: FontWeight.bold),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Get.theme.colorScheme.secondary
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          'Location: '.body(
                                              color: (controller
                                                      .appServices.isDark.value)
                                                  ? Get.theme.colorScheme
                                                      .secondary
                                                  : Get.theme.primaryColor),
                                          '${controller.tableData[index].location}'
                                              .body(weight: FontWeight.bold),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          childCount: controller.tableData.length,
                        ),
                      ),
            const SliverPadding(padding: EdgeInsets.all(40)),
          ],
        ),
      ),
    );
  }
}
