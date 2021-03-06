import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/core/theme/theme.dart';
import 'app/data/services/app_services.dart';
import 'app/data/services/translation_service.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> initServices() async {
  Get.log('starting services ...');
  await Get.putAsync<AppServices>(() async => AppServices());
  await Get.putAsync<TranslationService>(() => TranslationService().init());
  Get.log('All services started...');
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // sorry for the putting this function here :')
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final appServices = Get.find<AppServices>();
  final translationServices = Get.find<TranslationService>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'FEHU',
        theme: UiTheme.light,
        darkTheme: UiTheme.dark,
        themeMode: appServices.isDark.value ? ThemeMode.dark : ThemeMode.light,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: translationServices.supportedLocales(),
        // translations: Messages(),
        translationsKeys: translationServices.translations,
        locale: Get.locale ?? Locale(Get.deviceLocale!.languageCode),
        fallbackLocale: translationServices.fallbackLocale,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
