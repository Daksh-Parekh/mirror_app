import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gov_service_app/utils/helper/shr_helper.dart';
import 'package:gov_service_app/views/home_screen/model/home_model.dart';

class HomeProvider with ChangeNotifier {
  bool isTheme = false;
  ThemeMode? mode;
  int index = 0;
  double progressValue = 0;
  List<String> searchHistory = [];
  List<String> bookMark = [];
  bool isCheckEngine = true;

  List<SearchEngineModel> allSearchEngine = [
    SearchEngineModel(
      title: 'Google',
      searchEngUrl: WebUri('https://www.google.co.in'),
    ),
    SearchEngineModel(
      title: 'Yahho',
      searchEngUrl: WebUri('https://in.search.yahoo.com'),
    ),
  ];

  void changeTheme() {
    isTheme = !isTheme;
    ShrHelper helps = ShrHelper();
    helps.saveTheme(isTheme);
    notifyListeners();
  }

  void getThemes() async {
    ShrHelper hepls = ShrHelper();
    isTheme = await hepls.getTheme() ?? false;
    notifyListeners();
  }

  void setIndex(int inx) {
    index = inx;
    log('${index}');
    ShrHelper helps = ShrHelper();
    helps.saveSearchEngineIndex(index);
    notifyListeners();
  }

  Future<void> getSearchIndex() async {
    ShrHelper helps = ShrHelper();
    index = await helps.getSearchEngineIndex() ?? 0;
  }

  void changeProgressValue(double value) {
    progressValue = value;
    notifyListeners();
  }

  void saveSearchHistory(String value) {
    searchHistory.add(value);
    ShrHelper helper = ShrHelper();
    helper.saveSearchHistory(searchHistory);
    notifyListeners();
  }

  Future<void> getSearchHistory() async {
    ShrHelper helps = ShrHelper();
    searchHistory = await helps.getSearchHistory() ?? [];
  }

  void removeSearchHistory(int index) {
    searchHistory.removeAt(index);
    ShrHelper helper = ShrHelper();
    helper.saveSearchHistory(searchHistory);
    notifyListeners();
  }

  void savedBookMarkUrl(String url) {
    // name??'Untited';
    bookMark.add(url);
    ShrHelper helps = ShrHelper();
    helps.saveBookMarkUrl(bookMark);
    notifyListeners();
  }

  Future<void> getBookmarkListUrl() async {
    ShrHelper helps = ShrHelper();
    bookMark = await helps.getBookMarkUrl() ?? [];
  }

  void removeBookMarks(int index) {
    bookMark.removeAt(index);
    ShrHelper helps = ShrHelper();
    helps.saveBookMarkUrl(bookMark);
    notifyListeners();
  }

  void checkEngineStatus() {
    isCheckEngine = !isCheckEngine;
    ShrHelper helps = ShrHelper();
    helps.saveEngineCheck(isCheckEngine);
    notifyListeners();
  }

  void getEngineCheckArrow() async {
    ShrHelper hepls = ShrHelper();
    isCheckEngine = await hepls.getEngineCheckArrow() ?? false;
    notifyListeners();
  }
}
