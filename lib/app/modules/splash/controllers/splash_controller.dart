import 'dart:async';

import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:fehu_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => (appServices.accessToken.value.isEmpty)
          ? Get.offNamed(Routes.signup)
          : Get.offNamed(Routes.home),
    );
  }

  @override
  void onClose() {}
}
