import 'package:get/get.dart';

import '../modules/all_posts/bindings/all_posts_binding.dart';
import '../modules/all_posts/views/all_posts_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/signup_view.dart';
import '../modules/goals/bindings/goals_binding.dart';
import '../modules/goals/views/goals_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/info/bindings/info_binding.dart';
import '../modules/info/views/info_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/organizational_chart/bindings/organizational_chart_binding.dart';
import '../modules/organizational_chart/views/organizational_chart_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/student_activity/bindings/student_activity_binding.dart';
import '../modules/student_activity/views/student_activity_view.dart';
import '../modules/tables_drives/bindings/tables_drives_binding.dart';
import '../modules/tables_drives/views/tables_drives_view.dart';
import '../modules/vision_genesis/bindings/vision_genesis_binding.dart';
import '../modules/vision_genesis/views/vision_genesis_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.info,
      page: () => const InfoView(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: Routes.studentActivity,
      page: () => StudentActivityView(),
      binding: StudentActivityBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.tablesDrives,
      page: () => const TablesDrivesView(),
      binding: TablesDrivesBinding(),
    ),
    GetPage(
      name: Routes.allPosts,
      page: () => AllPostsView(),
      binding: AllPostsBinding(),
    ),
    GetPage(
      name: Routes.ORGANIZATIONAL_CHART,
      page: () => const OrganizationalChartView(),
      binding: OrganizationalChartBinding(),
    ),
    GetPage(
      name: Routes.VISION_GENESIS,
      page: () => const VisionGenesisView(),
      binding: VisionGenesisBinding(),
    ),
    GetPage(
      name: Routes.GOALS,
      page: () => const GoalsView(),
      binding: GoalsBinding(),
    ),
    GetPage(
      name: Routes.LOCATION,
      page: () => LocationView(),
      binding: LocationBinding(),
    ),
  ];
}
