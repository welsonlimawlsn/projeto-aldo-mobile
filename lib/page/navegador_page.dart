import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavegadorPage extends StatefulWidget {
  const NavegadorPage({Key? key}) : super(key: key);

  @override
  _NavegadorPageState createState() => _NavegadorPageState();
}

class _NavegadorPageState extends State<NavegadorPage> {
  final Completer<WebViewController> webViewController = new Completer();
  var controller = new TextEditingController(text: 'https://google.com.br');

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            child: TextField(
              controller: controller,
            ),
          ),
          actions: [
            IconButton(
              onPressed: atualizaTela,
              icon: Icon(
                Icons.send_outlined,
              ),
            )
          ]),
      body: WebView(
        initialUrl: controller.text,
        onWebViewCreated: (controller) {
          webViewController.complete(controller);
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void atualizaTela() {
    webViewController.future.then((value) {
      value.loadUrl(controller.text).whenComplete(() => setState(() {}));
    });
  }
}
