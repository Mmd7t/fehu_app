import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:fehu_app/app/modules/all_posts/views/all_posts_view.dart';
import 'package:fehu_app/app/modules/settings/views/settings_view.dart';
import 'package:fehu_app/app/modules/tables_drives/views/tables_drives_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  RxInt cindex = 0.obs;
  List<Widget>? pages = [
    AllPostsView(),
    const TablesDrivesView(),
    SettingsView(),
  ];
  List<Color> iconsColor = [
    const Color(0xFF4F4FBF),
    Colors.black,
    Colors.black
  ];

  List<String> titles = ['FEHU', 'Tables & Drives', 'Settings'];
  @override
  void onClose() {}
}
