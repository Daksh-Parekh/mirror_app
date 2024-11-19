import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gov_service_app/utils/helper/shr_helper.dart';
import 'package:gov_service_app/views/home_screen/model/home_model.dart';

class HomeProvider with ChangeNotifier {
  bool isTheme = false;
  ThemeMode? mode;
  int index = 0;
  double progressValue = 0;

  List<SearchEngineModel> allSearchEngine = [
    SearchEngineModel(
      title: 'Google',
      searchEngUrl: 'https://www.google.co.in/',
    ),
    SearchEngineModel(
      title: 'Yahho',
      searchEngUrl: 'https://in.search.yahoo.com/?fr2=inr',
    ),
    SearchEngineModel(
      title: 'Safari',
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
    notifyListeners();
    ShrHelper helps = ShrHelper();
    helps.saveSearchEngineIndex(index);
  }

  Future<void> getSearchIndex() async {
    ShrHelper helps = ShrHelper();
    index = await helps.getSearchEngineIndex() ?? 0;
  }

  void changeProgressValue(double value) {
    progressValue = value;
    notifyListeners();
  }

  List<String> searchHistory = [];
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
}
