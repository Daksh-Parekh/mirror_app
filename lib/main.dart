import 'package:flutter/material.dart';
import 'package:gov_service_app/views/home_screen/provider/home_provider.dart';
import 'package:gov_service_app/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider()
            ..getThemes()
            ..getEngineCheckArrow()
            ..getSearchIndex()
            ..getSearchHistory()
            ..getBookmarkListUrl(),
        ),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: value.isTheme ? ThemeMode.dark : ThemeMode.light,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
