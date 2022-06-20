import 'package:get/get.dart';

import '../controllers/tables_drives_controller.dart';

class TablesDrivesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TablesDrivesController>(
      () => TablesDrivesController(),
    );
  }
}
