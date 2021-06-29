import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
/// ACTIVITY PARA O NAVEGADOR
class NavegadorPage extends StatefulWidget {
  const NavegadorPage({Key? key}) : super(key: key);

  @override
  _NavegadorPageState createState() => _NavegadorPageState();
}

class _NavegadorPageState extends State<NavegadorPage> {

  final Completer<WebViewController> webViewController = new Completer();


  var controller = new TextEditingController(text: 'https://google.com.br');

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
              onPressed: _acessaEnderecoDigitado,
              icon: Icon(
                Icons.send_outlined,
              ),
            )
          ]),

      /// WebView, abre uma pagina da web
      body: WebView(
        initialUrl: controller.text,
        onWebViewCreated: (controller) {
          webViewController.complete(controller);
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void _acessaEnderecoDigitado() {
    webViewController.future.then((value) {
      value.loadUrl(controller.text)
          .whenComplete(() => setState(() {}));
    });
  }
}
