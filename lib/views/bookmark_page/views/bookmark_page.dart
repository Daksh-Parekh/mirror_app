import 'package:flutter/material.dart';
import 'package:gov_service_app/main.dart';
import 'package:gov_service_app/views/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("BookMark"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: hWatch.bookMark.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                "${index + 1}",
                style: TextStyle(fontSize: 20),
              ),
              title: Text(
                "${hWatch.bookMark[index]}",
                style: TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  hRead.removeBookMarks(index);
                },
                icon: Icon(Icons.delete_forever_rounded),
              ),
            );
          },
        ),
      ),
    );
  }
}
