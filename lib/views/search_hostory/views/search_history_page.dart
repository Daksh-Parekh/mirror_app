import 'package:flutter/material.dart';
import 'package:gov_service_app/main.dart';
import 'package:gov_service_app/views/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SearchHistoryPage extends StatefulWidget {
  const SearchHistoryPage({super.key});

  @override
  State<SearchHistoryPage> createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search History"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: hWatch.searchHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                "${index + 1}",
                style: TextStyle(fontSize: 20),
              ),
              title: Text("${hWatch.searchHistory[index]}"),
              trailing: IconButton(
                onPressed: () {
                  hRead.removeSearchHistory(index);
                  // hWatch.searchHistory.removeAt(index);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
