import 'package:flutter/material.dart';
import 'package:gov_service_app/views/home_screen/views/home_page.dart';

class AppRoutes {
  static String homPage = '/';

  static Map<String, Widget Function(BuildContext)> routes = {
    homPage: (context) => HomePage(),
  };
}
