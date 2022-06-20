import 'package:get/get.dart';

import '../controllers/student_activity_controller.dart';

class StudentActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentActivityController>(
      () => StudentActivityController(),
    );
  }
}
