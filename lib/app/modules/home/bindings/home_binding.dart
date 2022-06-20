import 'package:fehu_app/app/modules/all_posts/controllers/all_posts_controller.dart';
import 'package:fehu_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:fehu_app/app/modules/tables_drives/controllers/tables_drives_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AllPostsController>(() => AllPostsController());
    Get.lazyPut<TablesDrivesController>(() => TablesDrivesController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
