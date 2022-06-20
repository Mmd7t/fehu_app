import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'dart:io' as io;

import '../providers/shared_prefs.dart';

class TranslationService extends GetxService {
  final translations = <String, Map<String, String>>{}.obs;
  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = const Locale('en', 'US');

  // must add language codes here
  static final languages = [
    'en_US',
    'ar',
  ];

  @override
  onInit() {
    super.onInit();
    getLocale();
  }

  Future<TranslationService> init() async {
    for (var lang in languages) {
      var _file = await Helper.getJsonFile('assets/locales/$lang.json');
      translations.putIfAbsent(lang, () => Map<String, String>.from(_file));
    }
    return this;
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationService.languages.map((_locale) {
      return fromStringToLocale(_locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String _locale) {
    if (_locale.contains('_')) {
      // en_US
      return Locale(
          _locale.split('_').elementAt(0), _locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(_locale);
    }
  }

  getLocale() async {
    String? _locale = await SharedPrefsHelper.getLanguage();
    if (_locale != null) {
      Get.updateLocale(Locale(_locale));
    }
  }
}

class Helper {
  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  static Future<dynamic> getFilesInDirectory(String path) async {
    var files = io.Directory(path).listSync();
    Get.printInfo(info: files.toString());
    // return rootBundle.(path).then(convert.jsonDecode);
  }
}
