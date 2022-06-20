import 'package:get/get.dart';

import '../controllers/organizational_chart_controller.dart';

class OrganizationalChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganizationalChartController>(
      () => OrganizationalChartController(),
    );
  }
}
