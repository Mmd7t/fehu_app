import 'package:fehu_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.titles[controller.cindex.value]),
            actions: [
              IconButton(
                onPressed: () => Get.toNamed(Routes.info),
                icon: ImageIcon(
                  const Svg('assets/svg/info.svg'),
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          extendBody: true,
          body: controller.pages?[controller.cindex.value],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: NavigationBar(
                destinations: [
                  NavigationDestination(
                    icon: ImageIcon(
                      const Svg('assets/svg/home.svg'),
                      color: controller.appServices.isDark.value
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      CupertinoIcons.folder,
                      color: controller.appServices.isDark.value
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'Table & Drives',
                  ),
                  NavigationDestination(
                    icon: ImageIcon(
                      const Svg('assets/svg/settings.svg'),
                      color: controller.appServices.isDark.value
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'Settings',
                  ),
                ],
                height: kBottomNavigationBarHeight + 20,
                selectedIndex: controller.cindex.value,
                onDestinationSelected: (val) {
                  controller.cindex.value = val;
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
