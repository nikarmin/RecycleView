import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:recycle_view/views/perfil_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class ConteudoNoticia extends StatefulWidget {
  final String title;
  final String content;
  final String author;
  final String image;
  final String url;

  const ConteudoNoticia(
      {Key? key,
      required this.title,
      required this.content,
      required this.image,
      required this.author,
      required this.url})
      : super(key: key);

  @override
  State<ConteudoNoticia> createState() => _ConteudoNoticiaState();
}

class _ConteudoNoticiaState extends State<ConteudoNoticia> {
  String? webpageContent;

  late final WebViewController _webController = WebViewController()
    ..loadRequest(Uri.parse(widget.url.toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/icons/account.png'),
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 900,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    top: 210,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                        color: Color.fromARGB(255, 234, 234, 234),
                      ),
                      child: Align(
                          child: Column(children: <Widget>[
                        const SizedBox(height: 15),
                        Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                              child: Row(
                                children: [
                                  Container(
                                      decoration:
                                          const BoxDecoration(shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.account_circle,
                                        size: 40,
                                        color: Colors.black,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(widget.author,
                                      style: const TextStyle(color: Colors.black)),
                                ],
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(widget.title,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: WebViewWidget(controller: _webController),
                          ),
                        )
                      ])),
                    ),
                  )
                ],
              ),
            ),
          )),
      backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
    );
  }
}
