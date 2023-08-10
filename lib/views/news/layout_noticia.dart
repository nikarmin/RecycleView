import 'package:flutter/material.dart';

class LayoutNoticia extends StatelessWidget {
  const LayoutNoticia({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://cdn.awsli.com.br/600x450/18/18885/produto/102523124/6ba7072878.jpg',
              height: 100,
              width: 100,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Título da notícia',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Descrição da notícia',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Data da notícia',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
