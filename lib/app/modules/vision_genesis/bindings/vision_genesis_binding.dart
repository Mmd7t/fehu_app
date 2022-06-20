import 'package:get/get.dart';

import '../controllers/vision_genesis_controller.dart';

class VisionGenesisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisionGenesisController>(
      () => VisionGenesisController(),
    );
  }
}
