import 'package:get/get.dart';

import '../../data/services/app_services.dart';

class Constants {
  static const String iconsPath = "assets/svgs/icons/";
  static const String illustrationsPath = "assets/svgs/illustrations/";
  static const String baseUrl = 'http://fehu.cardi-hu.com/';

  static final RegExp doubleRE = RegExp(r"-?(?:\d*\.)?\d+(?:[eE][+-]?\d+)?");

  static final authService = Get.find<AppServices>();

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${authService.accessToken.value}',
  };
}
