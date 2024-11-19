import 'package:flutter/material.dart';
import 'package:gov_service_app/views/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider hRead, hWatch;

  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              hRead.changeTheme();
            },
            icon: hWatch.isTheme
                ? Icon(Icons.dark_mode_rounded)
                : Icon(Icons.light_mode_rounded),
            // icon: Icon(Icons.sunny),
          ),
          //By use of switch theme change
          // Switch(
          //   value: hWatch.isTheme,
          //   onChanged: (value) {
          //     hRead.changeTheme();
          //   },
          // )
        ],
      ),
    );
  }
}
