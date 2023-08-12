import 'dart:convert';

import 'package:http/http.dart';
import 'package:recycle_view/models/noticia.dart';
import 'package:http/http.dart' as http;

import '../models/artigo.dart';

class NewsService {
  final endPointUrl =
      "http://newsapi.org/v2/everything?q=cotuca&apiKey=885038448a224a658b6824599de332d7";
  Future<List<Artigo>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    List<Artigo> articles = [];

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      body.forEach((element) {
        print(element);
        articles.add(Artigo.fromJson(element));
      });
      // List<Artigo> articles =
      //     body.map((dynamic item) => Artigo.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the articles");
    }
  }
}
