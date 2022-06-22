import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void initState() {
      super.initState();
      if (Platform.isAndroid) WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Packages'),
      ),
      body: const WebView(
        initialUrl: 'https://pub.dev',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
