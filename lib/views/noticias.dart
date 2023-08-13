import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recycle_view/models/noticia.dart';
import 'package:recycle_view/services/news_service.dart';
import 'package:recycle_view/views/perfil_page.dart';
import 'package:http/http.dart' as http;

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
        body: ListView.builder(
          itemCount: listResponse.length,
          itemBuilder: (context, index) {
            return LayoutNoticia(
              title: listResponse[index]['title'],
              description: listResponse[index]['description'],
              author: listResponse[index]['author'],
              image: listResponse[index]['urlToImage'],
            );
          },
        ));
  }
}
// ListView.builder(
//           itemCount: listResponse.length,
//           itemBuilder: (context, index) => Container(
//                   child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 150,
//                     width: 250,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0),
//                       child: Image.network(
//                         listResponse[index]['urlToImage'],
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   // Container(
//                   //     height: 100,
//                   //     width: 100,
//                   //     child: Image.network(
//                   //       listResponse[index]['urlToImage'],
//                   //       fit: BoxFit.fill,
//                   //     )),
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             listResponse[index]['title'],
//                             style: TextStyle(
//                                 fontSize: 18.0, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             listResponse[index]['description'],
//                             style: TextStyle(fontSize: 14.0),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             listResponse[index]['publishedAt'],
//                             style: TextStyle(fontSize: 14.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//               )
//               ),
