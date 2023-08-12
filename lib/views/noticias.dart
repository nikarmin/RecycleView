import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recycle_view/models/noticia.dart';
import 'package:recycle_view/services/news_service.dart';
import 'package:recycle_view/views/perfil_page.dart';
import 'package:http/http.dart' as http;

import '../models/artigo.dart';
import 'news/layout_noticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  List<Artigo> _listaDeNoticias = [];

  NewsService client = NewsService();

  // Future<void> getNoticias() async {
  //   var response = await get(Uri.parse(
  //       'http://newsapi.org/v2/top-headlines?country=us&apiKey=885038448a224a658b6824599de332d7'));
  //   var jsonData = jsonDecode(response.body);

  //   if (jsonData['status'] == 'ok') {
  //     jsonData['articles'].forEach((element) {
  //       if (element['urlToImage'] != null && element['description'] != null) {
  //         Artigo artigo = Artigo(
  //             source: Source.fromJson(element['source']),
  //             title: element['title'],
  //             description: element['description'],
  //             author: element['author']);
  //         _listaDeNoticias.add(artigo);
  //       }
  //     });
  //   }
  // }

  // Future<List<Artigo>> getData() async {
  //   final response = await http.get(Uri.parse(
  //       'http://newsapi.org/v2/top-headlines?country=us&apiKey=885038448a224a658b6824599de332d7'));

  //   // setState(() {
  //   Map<String, dynamic> json = jsonDecode(response.body);
  //   List<dynamic> body = json['articles'];
  //   print(body.map((dynamic item) => Artigo.fromJson(item)).toList());
  //   _listaDeNoticias =
  //       body.map((dynamic item) => Artigo.fromJson(item)).toList();

  //   //return _listaDeNoticias;
  //   // _listaDeNoticias =
  //   //     Noticia.fromJson(json.decode(response.body)).articles;
  //   // });

  //   return _listaDeNoticias;
  // }

  // getDoGet() async {
  //   Noticia newsdata = Noticia(
  //     status: 'ok',
  //     articles: [],
  //   );

  //   await newsdata.getNoticias();

  //   _listaDeNoticias = newsdata.articles;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getDoGet();
  //   //getData();
  // }

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
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Artigo>> snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text("TESXT FHBIUABSD FODASE "));
            // List<Artigo> noticias = snapshot.data!;
            // return ListView.builder(
            //     itemCount: noticias.length,
            //     itemBuilder: (context, index) => LayoutNoticia(
            //           artigo: noticias[index],
            //         ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
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