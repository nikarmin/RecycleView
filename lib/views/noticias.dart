import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recycle_view/models/noticia.dart';
import 'package:recycle_view/services/news_service.dart';
import 'package:recycle_view/views/conteudo_noticia.dart';
import 'package:recycle_view/views/perfil_page.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../models/artigo.dart';
import 'layout/layout_noticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  late String stringResponse;
  late Map mapResponse;
  List listResponse = [];

  Future apiCall() async {
    http.Response response;
    // https://newsdata.io/api/1/news?apikey=pub_2873739814a209a95f5d477831ae2a5f5fa6b&q=reciclagem
    String url =
        "https://newsapi.org/v2/everything?q=reciclagem&apiKey=885038448a224a658b6824599de332d7";
    response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        listResponse = mapResponse["articles"];
      });
    } else {
      print("FODASE TUDIO");
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
              color: Colors.black),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/icons/account.png'),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Perfil();
                }));
              },
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(233, 233, 233, 1),
        body: ListView.builder(
          itemCount: listResponse.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConteudoNoticia(
                    author: listResponse[index]['author'],
                    content: listResponse[index]['content'],
                    image: listResponse[index]['urlToImage'],
                    title: listResponse[index]['title'],
                    url: listResponse[index]['url'],
                  );
                }));
              },
              child: LayoutNoticia(
                title: listResponse[index]['title'] != null
                    ? listResponse[index]['title']
                    : "",
                description: listResponse[index]['description'] != null
                    ? listResponse[index]['description']
                    : "",
                author: listResponse[index]['author'] != null
                    ? listResponse[index]['author']
                    : "",
                image: listResponse[index]['urlToImage'] != null
                    ? listResponse[index]['urlToImage']
                    : "",
              ),
            );
          },
        ));
  }
}
