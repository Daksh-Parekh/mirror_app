import 'package:flutter/material.dart';
import 'package:gov_service_app/home_screen/provider/home_provider.dart';
import 'package:gov_service_app/home_screen/views/home_page.dart';
import 'package:gov_service_app/web_view_page/views/web_view.dart';
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
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
          '/web_view': (context) => WebView(),
        },
      ),
    );
  }
}
