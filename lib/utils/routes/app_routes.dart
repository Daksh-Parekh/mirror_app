import 'package:flutter/material.dart';
import 'package:gov_service_app/views/bookmark_page/views/bookmark_page.dart';
import 'package:gov_service_app/views/home_screen/views/home_page.dart';
import 'package:gov_service_app/views/search_hostory/views/search_history_page.dart';

class AppRoutes {
  static String homPage = '/';
  static String searchHistory = '/search_history';
  static String bookMark = '/bookMark';

  static Map<String, Widget Function(BuildContext)> routes = {
    homPage: (context) => HomePage(),
    searchHistory: (context) => SearchHistoryPage(),
    bookMark: (context) => BookmarkPage(),
  };
}
