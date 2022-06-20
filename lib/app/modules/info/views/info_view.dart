import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FEHU'),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.jpeg',
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'تسعى كلية هندسة حلوان إلى إعداد خريجين مؤهلين فى التخصصات الهندسية المختلفة وتزويدهم بالمهارات والمعارف اللازمة لخدمة مؤسسات سوق العمل وأداء واجباتهم المهنية، والإسهام فى التقدم العلمى من خلال برامج الدراسات العليا، إضافة إلى الإرتقاء بالأداء المهنى المطلوب فى جهات العمل من خلال الخدمات الإستشارية والبحوث التطبيقية وبرامج التدريب لتنمية البيئة وخدمة المجتمع محليا واقليميا',
                  style: TextStyle(
                    fontSize: 20,
                    color: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 15),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.ORGANIZATIONAL_CHART),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Get.theme.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: '1'.body(
                              color: Get.theme.primaryColor,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ),
                    textColor: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black,
                    title: const Text(
                      'الهيكل التنظيمى للكلية',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.VISION_GENESIS),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Get.theme.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: '2'.body(
                              color: Get.theme.primaryColor,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ),
                    textColor: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black,
                    title: const Text(
                      'النشأة والرؤيـة والرسالـة',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.GOALS),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Get.theme.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: '3'.body(
                              color: Get.theme.primaryColor,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ),
                    textColor: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black,
                    title: const Text(
                      'الاهداف',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.LOCATION),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Get.theme.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: '4'.body(
                              color: Get.theme.primaryColor,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ),
                    textColor: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black,
                    title: const Text(
                      'الموقع الجغرافي',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
