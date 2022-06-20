import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:get/get.dart';

class OrganizationalChartController extends GetxController {
  //TODO: Implement OrganizationalChartController
  AppServices appServices = Get.find<AppServices>();
  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}
