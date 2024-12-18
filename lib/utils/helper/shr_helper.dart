import 'dart:developer';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  Future<void> saveTheme(bool isThemes) async {
    log('${isThemes}');
    SharedPreferences prefes = await SharedPreferences.getInstance();
    prefes.setBool('theme', isThemes);
  }

  Future<bool?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme');
  }

  Future<void> saveSearchEngineIndex(int inx) async {
    log('saved${inx}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('index', inx);
  }

  Future<int?> getSearchEngineIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('index');
  }

  void saveSearchHistory(List<String> searchHistory) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history', searchHistory);
  }

  Future<List<String>?> getSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('history');
  }

  Future<void> saveBookMarkUrl(List<String> bookmarkList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('bookmark', bookmarkList);
  }

  Future<List<String>?> getBookMarkUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('bookmark');
  }

  Future<void> saveEngineCheck(bool isCheckEngineArrow) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('arrow', isCheckEngineArrow);
  }

  Future<bool?> getEngineCheckArrow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('arrow');
  }
}
