import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:get/get.dart';

class VisionGenesisController extends GetxController {
  //TODO: Implement VisionGenesisController
  AppServices appServices = Get.find<AppServices>();
  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}
