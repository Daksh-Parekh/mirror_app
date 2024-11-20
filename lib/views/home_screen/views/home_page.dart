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
  TextEditingController urlController = TextEditingController();
  PullToRefreshController? pullToRefreshController;

  late HomeProvider hRead, hWatch;
  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        webViewController?.reload();
      },
    );
    urlController.clear();
    // TODO: implement initState
    super.initState();
  }

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
                  currentAccountPicture: CircleAvatar(
                    foregroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    ),
                  ),
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
              title: Text("Google Search Engine"),
              trailing: hWatch.isCheckEngine
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.check,
                      color: Colors.grey,
                    ),
              onTap: () {
                hRead.setIndex(0);
                webViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: hWatch.allSearchEngine[0].searchEngUrl,
                  ),
                );
                hRead.checkEngineStatus();
              },
            ),
            ListTile(
              title: Text("Yahoo Search Engine"),
              trailing: hWatch.isCheckEngine
                  ? Icon(
                      Icons.check,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
              onTap: () {
                hRead.setIndex(1);
                webViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: hWatch.allSearchEngine[1].searchEngUrl,
                  ),
                );
                hRead.checkEngineStatus();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              webViewController?.goBack();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          IconButton(
            onPressed: () {
              webViewController?.reload();
            },
            icon: Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () {
              webViewController?.goForward();
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
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
                      webViewController?.loadUrl(
                        urlRequest: URLRequest(
                          url: WebUri(
                              '${hWatch.allSearchEngine[hWatch.index].searchEngUrl}/search?q=$value'),
                        ),
                      );
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
              pullToRefreshController: pullToRefreshController,
              onLoadStop: (controller, url) {
                pullToRefreshController!.endRefreshing();
              },
              initialUrlRequest: URLRequest(
                  url: WebUri(
                      '${hWatch.allSearchEngine[hWatch.index].searchEngUrl}')),
              onWebViewCreated: (controller) {
                webViewController = controller;
                webViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: hWatch.allSearchEngine[hWatch.index].searchEngUrl,
                  ),
                );
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
