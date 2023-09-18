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