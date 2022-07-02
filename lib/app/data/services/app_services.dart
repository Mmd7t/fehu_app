import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../providers/shared_prefs.dart';

class AppServices extends GetxService {
  @override
  onInit() {
    super.onInit();
    getThemeFromPrefs();
    getAccessToken();
    getUserId();
    getuserdata();
    registerNotification();
    // registerNotification();
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  FirebaseMessaging? _messaging;
  void registerNotification() async {
    // await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging!.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

        // todo put the logic for handling here
        // if the tag of the message == to special tag from server
        // do some logic
        // my code's example:
        /// if (message.notification?.title == 'queue') {
        ///   isMessage = true;
        /// }
        // when the title coming from the server = queue (2tf2t m3 omar 3aleeh)
        // set the isMessage flag = true
        // inside the logic of my code theres a listener (Timer.periodic every 1sec)
        // when the listener gets the flag = true call a function and set the flag = false
        // and start over if a notification came.
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Variables  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxBool isDark = false.obs;
  RxString accessToken = RxString('');
  RxInt? userId;
  RxBool isFirstTime = true.obs;
  RxString? name1;
  RxString? phone1;
  RxString? email1;
  RxString? photo1;

  RxList<String?> drives = <String>[].obs;

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Save Functions  -----------------------------*/
  /*--------------------------------------------------------------------------*/

  void setIsFirstTime(bool val) async {
    isFirstTime = val.obs;
    SharedPrefsHelper.storeisFirstTime(val);
  }

  void saveAccessToken(String token) {
    accessToken = token.obs;
    SharedPrefsHelper.saveApiKeyToPrefs(token);
  }

  void saveUserId(int id) {
    userId = id.obs;
    SharedPrefsHelper.saveUserIdToPrefs(id);
  }

  changeTheme(bool value) {
    isDark.value = value;
    SharedPrefsHelper.saveTheme(value);
  }

  void savefirsttime(bool value) {
    isFirstTime = value.obs;
    SharedPrefsHelper.storeisFirstTime(value);
  }

  void saveusername(String value) {
    name1 = value.obs;
    SharedPrefsHelper.saveUserNameToPrefs(value);
  }

  void saveuserphone(String value) {
    phone1 = value.obs;
    SharedPrefsHelper.saveUserPhoneToPrefs(value);
  }

  void saveuseremail(String value) {
    email1 = value.obs;
    SharedPrefsHelper.saveUseremailToPrefs(value);
  }

  void saveDrives(List<String> values) {
    drives = values.obs;
    SharedPrefsHelper.storeDriveLinks(
        values[0], values[1], values[2], values[3], values[4]);
  }

  /*--------------------------------------------------------------------------*/
  /*----------------------------  Get Functions  -----------------------------*/
  /*--------------------------------------------------------------------------*/

  void getAccessToken() async {
    String? data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      accessToken = data.obs;
      Get.log('Access Token :: $data');
    }
  }

  void getUserId() async {
    int? data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
      print('Userrrrrr id ::: $userId');
    }
  }

  getThemeFromPrefs() async {
    bool val = await SharedPrefsHelper.checkTheme();
    if (val) {
      isDark.value = await SharedPrefsHelper.getTheme();
    } else {
      isDark.value = false;
    }
  }

  void getfirsttime() async {
    bool? data = await SharedPrefsHelper.getIsFirstTime();
    if (data != null) {
      isFirstTime = data.obs;
    }
  }

  /*--------------------------------------------------------------------------*/
  /*--------------------------  user info  Functions  ----------------------------*/
  /*--------------------------------------------------------------------------*/
  void getuserdata() async {
    String? name = await SharedPrefsHelper.getUserNameFromPrefs();
    String? phone = await SharedPrefsHelper.getUserPhoneFromPrefs();
    String? email = await SharedPrefsHelper.getUseremailFromPrefs();
    List<String?>? drives = await SharedPrefsHelper.getDriveLinks();
    if (name != null) {
      name1 = name.obs;
    } else {
      name1 = ''.obs;
    }
    if (phone != null) {
      phone1 = phone.obs;
    } else {
      phone1 = ''.obs;
    }
    if (email != null) {
      email1 = email.obs;
    } else {
      email1 = ''.obs;
    }
    if (drives != null) {
      this.drives = drives.obs;
    } else {
      this.drives = <String?>[].obs;
    }
  }

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Remove Functions  ----------------------------*/
  /*--------------------------------------------------------------------------*/

  removeUserData() async {
    await SharedPrefsHelper.removeToken();
    await SharedPrefsHelper.removeUserId();
    await SharedPrefsHelper.removeUserdata();
    await SharedPrefsHelper.removeDriveLinks();

    accessToken.value = '';
    userId!.value = 0;
    name1 = null;
    phone1 = null;
    email1 = null;
    photo1 = null;
    drives.value = [];
  }
}
