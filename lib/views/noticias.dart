import 'package:flutter/material.dart';
import 'package:recycle_view/models/noticia.dart';
import 'package:recycle_view/services/news_service.dart';
import 'package:recycle_view/views/perfil_page.dart';

import 'news/layout_noticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  NewsService newsService = NewsService();

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
        future: NewsService().getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
          if (snapshot.hasData) {
            List<Noticia> noticias = snapshot.data!;
            return ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (context, index) =>
                    ListTile(title: Text(noticias[index].title!)));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

//// builder: Container(
        //   child: ListView.builder(
        //       itemCount: 5, itemBuilder: (context, index) => LayoutNoticia()),
        // ),