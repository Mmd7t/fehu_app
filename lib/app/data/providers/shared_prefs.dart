import 'package:shared_preferences/shared_preferences.dart';
// import 'constants.dart';

class SharedPrefsHelper {
  static SharedPreferences? prefs;

/*----------------------------------------------------------------------------*/
/*----------------------------  Initialize Prefs  ----------------------------*/
/*----------------------------------------------------------------------------*/
  static initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

/*----------------------------------------------------------------------------*/
/*------------------------------  Access Token  ------------------------------*/
/*----------------------------------------------------------------------------*/
  static void saveApiKeyToPrefs(accessToken) async {
    await initPrefs();
    prefs!.setString('accessToken', accessToken);
  }

  static Future<String?> getApiTokenFromPrefs() async {
    await initPrefs();
    String? accessTokenSaved = prefs!.getString('accessToken');
    if (accessTokenSaved == null) {
      return null;
    } else {
      return accessTokenSaved;
    }
  }

  static Future removeToken() async {
    await initPrefs();
    prefs!.remove('accessToken');
  }

/*----------------------------------------------------------------------------*/
/*---------------------------------  User Id  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static void saveUserIdToPrefs(userid) async {
    await initPrefs();
    prefs!.setInt('userId', userid);
  }

  static Future<int?> getUserIdFromPrefs() async {
    await initPrefs();
    int? userIdSaved = prefs!.getInt('userId');
    if (userIdSaved == null) {
      return null;
    } else {
      return userIdSaved;
    }
  }

  static Future removeUserId() async {
    await initPrefs();
    prefs!.remove('userId');
  }

  /*----------------------------------------------------------------------------*/
/*---------------------------------  User info data  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static void saveUserNameToPrefs(username) async {
    await initPrefs();
    prefs!.setString('username', username);
  }

  static Future<String?> getUserNameFromPrefs() async {
    await initPrefs();
    String? userusernameSaved = prefs!.getString('username');
    if (userusernameSaved == null) {
      return null;
    } else {
      return userusernameSaved;
    }
  }

  static void saveUserPhoneToPrefs(phone) async {
    await initPrefs();
    prefs!.setString('userPhone', phone);
  }

  static Future<String?> getUserPhoneFromPrefs() async {
    await initPrefs();
    String? userPhoneSaved = prefs!.getString('userPhone');
    if (userPhoneSaved == null) {
      return null;
    } else {
      return userPhoneSaved;
    }
  }

  static void saveUseremailToPrefs(email) async {
    await initPrefs();
    prefs!.setString('useremail', email);
  }

  static Future<String?> getUseremailFromPrefs() async {
    await initPrefs();
    String? useruseremailSaved = prefs!.getString('useremail');
    if (useruseremailSaved == null) {
      return null;
    } else {
      return useruseremailSaved;
    }
  }

  static Future removeUserdata() async {
    await initPrefs();
    prefs!.remove('username');
    prefs!.remove('userPhone');
    prefs!.remove('useremail');
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  App Theme  -------------------------------*/
/*----------------------------------------------------------------------------*/
  static Future<bool> checkTheme() async {
    final _shared = await SharedPreferences.getInstance();
    return _shared.containsKey("theme");
  }

  static Future saveTheme(bool themeId) async {
    await initPrefs();
    prefs!.setBool('theme', themeId);
  }

  static Future<bool> getTheme() async {
    await initPrefs();
    bool? themeIdSaved = prefs!.getBool('theme');
    return themeIdSaved!;
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  Language  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static storeLanguage(String language) async {
    await initPrefs();
    await prefs!.setString("lang", language);
  }

  static Future<String?> getLanguage() async {
    await initPrefs();
    return prefs?.getString("lang");
  }

  static removeLanguage() async {
    await initPrefs();
    prefs?.remove("lang");
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  First time  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static void storeisFirstTime(bool isFirstTime) async {
    await initPrefs();
    prefs!.setBool("isFirstTime", isFirstTime);
  }

  static Future<bool?> getIsFirstTime() async {
    await initPrefs();
    bool? isFirstTimeSaved = prefs!.getBool("isFirstTime");
    return isFirstTimeSaved;
  }

  static removeIsFirstTime() async {
    await initPrefs();
    prefs!.remove("isFirstTime");
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  Drive Links  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static void storeDriveLinks(
    String drive0,
    String drive1,
    String drive2,
    String drive3,
    String drive4,
  ) async {
    await initPrefs();
    prefs!.setString("drive0", drive0);
    prefs!.setString("drive1", drive1);
    prefs!.setString("drive2", drive2);
    prefs!.setString("drive3", drive3);
    prefs!.setString("drive4", drive4);
  }

  static Future<List<String?>?> getDriveLinks() async {
    await initPrefs();
    String? drive0 = prefs!.getString("drive0");
    String? drive1 = prefs!.getString("drive1");
    String? drive2 = prefs!.getString("drive2");
    String? drive3 = prefs!.getString("drive3");
    String? drive4 = prefs!.getString("drive4");
    return [drive0, drive1, drive2, drive3, drive4];
  }

  static removeDriveLinks() async {
    await initPrefs();
    prefs!.remove("drive0");
    prefs!.remove("drive1");
    prefs!.remove("drive2");
    prefs!.remove("drive3");
    prefs!.remove("drive4");
  }
}
