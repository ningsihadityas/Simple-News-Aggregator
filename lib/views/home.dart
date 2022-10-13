// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:qlipper/helper/news.dart';
// import 'package:qlipper/login/login_page.dart';
// import 'package:qlipper/helper/category_data.dart';
// import 'package:qlipper/model/article_model.dart';
// import 'package:qlipper/model/category_model.dart';

// import 'article_view.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<CategoryModel> newsCategories = [];
//   List<ArticleModel> articles = [];

//   bool _loading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     newsCategories = getCategories();
//     getNews();
//   }

//   getNews() async {
//     News newsClass = News();
//     await newsClass.getNews();
//     articles = newsClass.news;

//     setState(() {
//       _loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffE4ECF9),

//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//               icon: Icon(
//                 Icons.person,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginPage(),
//                     ));
//               }),
//         ],
//         iconTheme: IconThemeData(color: Color(0xff081B37)),
//         title: Text(
//           'Qlipper.id',
//           style: TextStyle(color: Color(0xff081B37)),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xffE4ECF9),
//         elevation: 0.0,
//       ),
//       drawer: Drawer(),

//       body: _loading
//           ? Center(
//               child: Container(
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 17),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.search),
//                       title: TextField(
//                         // controller: controller,
//                         // onChanged: onSearch,
//                         decoration: InputDecoration(
//                             hintText: "search", border: InputBorder.none),
//                       ),
//                     ),

//                     //categories
//                     Container(
//                       height: 70,
//                       child: ListView.builder(
//                         itemCount: newsCategories.length,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return CategoryTile(
//                             imgUrl: newsCategories[index].imgUrl,
//                             categoryName: newsCategories[index].categoryName,
//                           );
//                         },
//                       ),
//                     ),

//                     //blogs

//                     Container(
//                       padding: EdgeInsets.only(top: 15),
//                       child: ListView.builder(
//                           physics: ClampingScrollPhysics(),
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           itemCount: articles.length,
//                           itemBuilder: (context, index) {
//                             return BlogTile(
//                               imgUrl: articles[index].urlToImage,
//                               title: articles[index].title,
//                               desc: articles[index].description,
//                               url: articles[index].url,
//                             );
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//             ),

//       // body: SafeArea(
//       //   child: Container(
//       //     padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
//       //     child: Column(
//       //       children: [
//       //         // ListTile(
//       //         //   leading: Icon(Icons.search),
//       //         //   title: TextField(
//       //         //     controller: controller,
//       //         //     onChanged: onSearch,
//       //         //     decoration: InputDecoration(
//       //         //         hintText: "search", border: InputBorder.none),
//       //         //   ),
//       //         // ),

//       //         // Expanded(
//       //         //     child: _search.length != 0 || controller.text.isNotEmpty
//       //         //         ? ListView.builder(
//       //         //             itemCount: _search.length,
//       //         //             itemBuilder: (context, index) {
//       //         //               final itemData = _search[index];

//       //         //               return new Card(
//       //         //                 child: Row(
//       //         //                   mainAxisAlignment:
//       //         //                       MainAxisAlignment.spaceBetween,
//       //         //                   children: [
//       //         //                     Flexible(
//       //         //                       child: Padding(
//       //         //                         padding: const EdgeInsets.all(15),
//       //         //                         child: Text(
//       //         //                           itemData.title,
//       //         //                           style: TextStyle(fontSize: 20),
//       //         //                           maxLines: 1,
//       //         //                           overflow: TextOverflow.ellipsis,
//       //         //                         ),
//       //         //                       ),
//       //         //                     ),
//       //         //                   ],
//       //         //                 ),
//       //         //               );
//       //         //             })
//       //         //         : ListView.builder(
//       //         //             itemCount: _list.length,
//       //         //             itemBuilder: (context, index) {
//       //         //               final itemData = _list[index];

//       //         //               return new Card(
//       //         //                 child: Row(
//       //         //                   mainAxisAlignment:
//       //         //                       MainAxisAlignment.spaceBetween,
//       //         //                   children: [
//       //         //                     Flexible(
//       //         //                       child: Padding(
//       //         //                         padding: const EdgeInsets.all(15),
//       //         //                         child: Text(
//       //         //                           itemData.title,
//       //         //                           style: TextStyle(fontSize: 20),
//       //         //                           maxLines: 1,
//       //         //                           overflow: TextOverflow.ellipsis,
//       //         //                         ),
//       //         //                       ),
//       //         //                     ),
//       //         //                   ],
//       //         //                 ),
//       //         //               );
//       //         //             })),
//       //       ],
//       //     ),
//       //   ),
//       // )
//     );
//   }
//   //}
// }

// class CategoryTile extends StatelessWidget {
//   final imgUrl, categoryName;
//   CategoryTile({this.imgUrl, this.categoryName});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: EdgeInsets.only(right: 16),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: CachedNetworkImage(
//                 imageUrl: imgUrl,
//                 width: 120,
//                 height: 60,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               width: 120,
//               height: 60,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.black26,
//               ),
//               child: Text(
//                 categoryName,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BlogTile extends StatelessWidget {
//   final String imgUrl, title, desc, url;
//   BlogTile(
//       {@required this.imgUrl,
//       @required this.title,
//       @required this.desc,
//       @required this.url});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ArticleView(
//                       blogUrl: url,
//                     )));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 15),
//         child: Column(
//           children: [
//             ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(imgUrl)),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               desc,
//               style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qlipper/collection/collection_page.dart';
import 'package:qlipper/helper/news.dart';
import 'package:qlipper/login/login_page.dart';
import 'package:qlipper/helper/category_data.dart';
import 'package:qlipper/model/article_model.dart';
import 'package:qlipper/model/category_model.dart';

import 'article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> newsCategories = [];
  List<ArticleModel> articles = [];
  List<ArticleModel> _search = [];

  bool _loading = true;

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    articles.forEach((item) {
      if (item.title.contains(text)) _search.add(item);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsCategories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xffE4ECF9),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //         padding: EdgeInsets.only(right: 30),
      //         icon: Icon(Icons.person),
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => CollectionPage(),
      //               ));
      //         }),
      //   ],
      //   iconTheme: IconThemeData(color: Color(0xff081B37)),
      //   title: Text(
      //     'QLIPPER',
      //     style: TextStyle(color: Color(0xff081B37), fontFamily: 'PTSerif'),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        'News App',
                        style: TextStyle(
                            color: Color(0xff081B37),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.search),
                                  title: TextField(
                                    controller: controller,
                                    onChanged: onSearch,
                                    decoration: InputDecoration(
                                        hintText: "search",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              //categories
                              Container(
                                height: 70,
                                child: ListView.builder(
                                  itemCount: newsCategories.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CategoryTile(
                                      imgUrl: newsCategories[index].imgUrl,
                                      categoryName:
                                          newsCategories[index].categoryName,
                                    );
                                  },
                                ),
                              ),

                              //blogs

                              Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: _search.length != 0 ||
                                          controller.text.isNotEmpty
                                      ? ListView.builder(
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: _search.length,
                                          itemBuilder: (context, index) {
                                            return BlogTile(
                                              imgUrl: _search[index].urlToImage,
                                              title: _search[index].title,
                                              desc: _search[index].description,
                                              url: _search[index].url,
                                            );
                                          })
                                      : ListView.builder(
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: articles.length,
                                          itemBuilder: (context, index) {
                                            return BlogTile(
                                              imgUrl:
                                                  articles[index].urlToImage,
                                              title: articles[index].title,
                                              desc: articles[index].description,
                                              url: articles[index].url,
                                            );
                                          }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imgUrl, categoryName;
  CategoryTile({this.imgUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc, url;
  BlogTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.network(imgUrl),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Container(
                    //     width: 40,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       color: Colors.black12,
                    //     ),
                    //     child: Icon(
                    //       Icons.bookmark,
                    //       color: Colors.white,
                    //       size: 40,
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
