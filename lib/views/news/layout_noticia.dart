import 'package:flutter/material.dart';
import 'package:recycle_view/models/noticia.dart';

import '../../models/artigo.dart';

class LayoutNoticia extends StatelessWidget {
  const LayoutNoticia({super.key, required this.artigo});

  final Artigo artigo;

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              width: 100, /*child: Image.network(artigo.urlToImage)*/
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      artigo.title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      artigo.description,
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Text(
                    //   artigo.publishedAt,
                    //   style: TextStyle(fontSize: 14.0),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
