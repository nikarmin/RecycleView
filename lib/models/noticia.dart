import 'dart:convert';

import 'package:http/http.dart';

import 'artigo.dart';

class Noticia {
  String status;
  String? error;
  int? totalResults;
  List<Artigo> articles;

  Noticia({required this.status, required this.articles});

  Noticia.fromJson(Map<String, dynamic> newsJson)
      : status = newsJson['status'],
        articles = List.from(newsJson['articles'])
            .map((article) => Artigo.fromJson(article))
            .toList(),
        totalResults = newsJson['totalResults'],
        error = newsJson['error'];
}
// class Artigo {
//   Source source;
//   String author;
//   String title;
//   String description;
//   String urlToImage;
//   String url;
//   String publishedAt;
//   String content;

//   Artigo.fromJson(Map<String, dynamic> articleJson)
//       : source = Source.fromJson(articleJson['source']),
//         author = articleJson['author'],
//         title = articleJson['title'],
//         description = articleJson['description'],
//         url = articleJson['url'],
//         urlToImage = articleJson['urlToImage'],
//         publishedAt = articleJson['publishedAt'],
//         content = articleJson['content'];
// }