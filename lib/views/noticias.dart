import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recycle_view/models/noticia.dart';
import 'package:recycle_view/services/news_service.dart';
import 'package:recycle_view/views/perfil_page.dart';
import 'package:http/http.dart' as http;

import 'news/layout_noticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  List<Artigo> _listaDeNoticias = [];

  void getData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'http://newsapi.org/v2/top-headlines?country=us&apiKey=885038448a224a658b6824599de332d7'));
      setState(() {
        _listaDeNoticias =
            Noticia.fromJson(json.decode(response.body)).articles;
      });
    } on Exception catch (e) {
      Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ImageIcon(AssetImage('assets/images/icons/earth-love.png'),
              color: Colors.black),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/icons/profile.png'),
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
        body: Container(
          child: ListView.builder(
              itemCount: _listaDeNoticias.length,
              itemBuilder: (context, index) =>
                  LayoutNoticia(artigo: _listaDeNoticias[index])),
        )
        // body: FutureBuilder(
        //   future: NewsService().getArticle(),
        //   builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
        //     if (snapshot.hasData) {
        //       List<Noticia> noticias = snapshot.data!;
        //       return ListView.builder(
        //           itemCount: noticias.length,
        //           itemBuilder: (context, index) => ListTile(
        //               title: Text(noticias[index].articles[index].title!)));
        //     } else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   },
        //),
        );
  }
}

//// builder: Container(
        //   child: ListView.builder(
        //       itemCount: 5, itemBuilder: (context, index) => LayoutNoticia()),
        // ),