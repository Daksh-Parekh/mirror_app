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
  TextEditingController nameController = TextEditingController();
  late HomeProvider hRead, hWatch;
  // String url = '';
  var urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.purple.shade200),
                  accountName: Text("Daksh"),
                  accountEmail: Text("Daksh@gmail.com"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 8),
                  child: IconButton(
                    onPressed: () {
                      hRead.changeTheme();
                    },
                    icon: hWatch.isTheme
                        ? Icon(
                            Icons.light_mode_rounded,
                            size: 40,
                            color: Colors.amber,
                          )
                        : Icon(
                            Icons.dark_mode_rounded,
                            size: 40,
                            color: Colors.black,
                          ),
                  ),
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.searchHistory);
              },
              title: Text("Search History"),
              trailing: Icon(Icons.history),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.bookMark);
              },
              title: Text("BookMark"),
              trailing: Icon(Icons.bookmark_added_rounded),
            ),
            ListTile(
              title: Text("Chrome"),
              onTap: () {
                hRead.setIndex(0);
              },
            ),
            ListTile(
              title: Text("yahoo"),
              onTap: () {
                hRead.setIndex(1);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
        // actions: [
        //   PopupMenuButton(
        //     onSelected: (value) {
        //       hRead.setIndex(value);

        //       WebUri? finaluri = hRead.allSearchEngine[value].searchEngUrl;
        //       // 'https://www.google.co.in/';

        //       webViewController?.loadUrl(urlRequest: URLRequest(url: finaluri));
        //     },
        //     itemBuilder: (context) {
        //       return [
        //         PopupMenuItem(
        //           child: Text("Google"),
        //           value: 0,
        //           // onTap: () {
        //           //   hRead.setIndex(0);
        //           // },
        //         ),
        //         PopupMenuItem(
        //           child: Text("Yahoo"),
        //           value: 1,
        //           // onTap: () {
        //           //   hRead.setIndex(1);
        //           // },
        //         ),
        //       ];
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SearchBar(
                    leading: Icon(Icons.search),
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.black38)),
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
                    hintText: "Search",
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      if (webViewController != null) {
                        WebUri? current = await webViewController!.getUrl();
                        print("====================${current}");
                        hRead.savedBookMarkUrl(current!.toString());
                      }
                    },
                    icon: Icon(Icons.bookmark_add_rounded))
              ],
            ),
          ),
          LinearProgressIndicator(
            value: hRead.progressValue,
          ),
          Text(
            "${hWatch.allSearchEngine[hWatch.index].title}",
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
