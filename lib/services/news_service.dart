import 'dart:convert';

import 'package:recycle_view/models/noticia.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Noticia>> getArticle() async {
    final queryParameters = {
      // 'country': 'us',
      // 'category': 'technology',
      'apiKey': '885038448a224a658b6824599de332d7'
    };
    final uri = Uri.https(endPointUrl, '/v2/everything/', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Noticia> articles =
        body.map((dynamic item) => Noticia.fromJson(item)).toList();
    return articles;
  }
}
