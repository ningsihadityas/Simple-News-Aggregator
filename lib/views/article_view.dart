import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffE4ECF9),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
              initialUrl: widget.blogUrl,
              userAgent:
                  "Mozilla/5.0 (Linux; Android 8.1.0; XXXXXXX SDK built for x86 Build/OSM 1180201026 ; wv) AppleWebkit/537.36 (KHTML, 11ke Gecko) Version/4.0 Chrome/61.0.3163.98 Mobile Safari/537.36",
              onWebViewCreated: ((WebViewController webViewController) {
                _completer.complete(webViewController);
              })),
        ),
      ),
    );
  }
}
