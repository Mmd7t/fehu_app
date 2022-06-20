import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:get/get.dart';

class GoalsController extends GetxController {
  //TODO: Implement GoalsController
  AppServices appServices = Get.find<AppServices>();
  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}
