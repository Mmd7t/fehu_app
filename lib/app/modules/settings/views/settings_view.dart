import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:fehu_app/app/routes/app_pages.dart';
import 'package:fehu_app/app/widgets/global_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  final AppServices _appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 43,
              backgroundColor: Get.theme.primaryColor,
              child: CircleAvatar(
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                child: Icon(
                  Icons.person_outline,
                  size: 45,
                  color: Get.theme.primaryColor,
                ),
                maxRadius: 40,
              ),
            ),
            '${_appServices.name1}'.subtitle(weight: FontWeight.bold),
            '${_appServices.email1}'.body(),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ListTile(
                title: 'Dark Mode'.subtitle(
                    color: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black),
                leading: Icon(
                  CupertinoIcons.moon_stars,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                trailing: CupertinoSwitch(
                  value: controller.appServices.isDark.value,
                  activeColor: Get.theme.primaryColor,
                  onChanged: (val) => controller.appServices.changeTheme(val),
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ListTile(
                title: 'Language'.subtitle(
                    color: (controller.appServices.isDark.value)
                        ? Colors.white
                        : Colors.black),
                leading: Icon(
                  Icons.language,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                trailing: 'En'.caption,
              ),
            ),
            const SizedBox(height: 25),
            GlobalButton(
              text: 'Logout',
              width: Get.width * 0.5,
              color: Get.theme.colorScheme.secondary,
              onPressed: () {
                _appServices.removeUserData();
                Get.offAllNamed(Routes.login);
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
