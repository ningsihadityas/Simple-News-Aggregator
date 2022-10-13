import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:qlipper/collection/collection_page.dart';
import 'package:qlipper/login/login_page.dart';
import 'package:qlipper/model/newsModel.dart';

//home page if user have not logged in

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts> _list = [];
  List<Posts> _search = [];

  Future<Null> fetchData() async {
    final response = await http.get(
      Uri.parse(Uri.encodeFull("https://jsonplaceholder.typicode.com/posts")),
    );

    if (response.statusCode == 200) {}
    final data = jsonDecode(response.body);
    setState(() {
      for (Map i in data) {
        _list.add(Posts.fromJson(i));
      }
    });
  }

  // List<Article> _list = [];
  // List<Article> _search = [];

  // Future<Null> fetchData() async {
  //   final response = await http.get(
  //     Uri.encodeFull(
  //         "https://newsapi.org/v2/everything?q=tesla&from=2021-02-19&sortBy=publishedAt&apiKey=61c21fa7c6684fd180959084b73ceaae"),
  //   );

  //   if (response.statusCode == 200) {}
  //   final data = jsonDecode(response.body);
  //   setState(() {
  //     for (Map i in data) {
  //       _list.add(Article.fromJson(i));
  //     }
  //   });
  // }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((item) {
      if (item.title.contains(text)) _search.add(item);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //  var bookmarkController = Provider.of<BookmarkController>(context);

    return Scaffold(
        backgroundColor: Color(0xffE4ECF9),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                }),
          ],
          iconTheme: IconThemeData(color: Color(0xff081B37)),
          title: Text(
            'Qlipper.id',
            style: TextStyle(color: Color(0xff081B37)),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffE4ECF9),
          elevation: 0.0,
        ),
        drawer: Drawer(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "search", border: InputBorder.none),
                  ),
                ),
                Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, index) {
                              final itemData = _search[index];

                              return new Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          itemData.title,
                                          style: TextStyle(fontSize: 20),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, index) {
                              final itemData = _list[index];

                              return new Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          itemData.title,
                                          style: TextStyle(fontSize: 20),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
              ],
            ),
          ),
        ));
  }
}
