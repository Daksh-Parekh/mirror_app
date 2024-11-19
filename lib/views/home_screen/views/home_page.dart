import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gov_service_app/utils/routes/app_routes.dart';
import 'package:gov_service_app/views/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? webViewController;
  late HomeProvider hRead, hWatch;
  // String url = '';
  var urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            Text("Home Page"),
            SearchBar(
              controller: urlController,
              onSubmitted: (value) {
                // var url = WebUri(value);
                // if (.isEmpty) {
                // WebUri url = WebUri("");

                webViewController?.loadUrl(
                    urlRequest: URLRequest(
                        url: WebUri(
                            'https://www.google.com/search?q=${value}')));
                hRead.saveSearchHistory(value);
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchHistory);
            },
            icon: Icon(Icons.history),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Google"),
                  onTap: () {
                    hRead.setIndex(0);
                  },
                ),
                PopupMenuItem(
                  child: Text("Yahoo"),
                  onTap: () {
                    hRead.setIndex(1);
                  },
                ),
              ];
            },
          ),
          IconButton(
            onPressed: () {
              hRead.changeTheme();
            },
            icon: hWatch.isTheme
                ? Icon(Icons.dark_mode_rounded)
                : Icon(Icons.light_mode_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: hRead.progressValue,
          ),
          Text(
            "${hRead.allSearchEngine[hWatch.index].title}",
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                  url: WebUri(
                      '${hWatch.allSearchEngine[hWatch.index].searchEngUrl}')),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                hRead.changeProgressValue(progress / 100);
              },
            ),
          ),
        ],
      ),
    );
  }
}
