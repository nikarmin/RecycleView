import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle_view/models/noticia.dart';

import '../../models/artigo.dart';

class LayoutNoticia extends StatelessWidget {
  const LayoutNoticia(
      {super.key,
      required this.title,
      required this.description,
      required this.author,
      required this.image});

  final String title;
  final String description;
  final String author;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromRGBO(233, 233, 233, 1),
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: (title == null &&
                                description == null &&
                                image == null &&
                                author == null)
                            ? Container()
                            : Container(
                                height: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                        255, 219, 219, 219),
                                    image: DecorationImage(
                                        image: NetworkImage(image),
                                        fit: BoxFit.cover)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 15, 10, 15),
                                              child: Text(title,
                                                  style: GoogleFonts.archivo(
                                                    textStyle: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  )))),
                                      SizedBox(height: 70),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            child: Text(author,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    //fontWeight: FontWeight.bold,
                                                    color: Colors.white))),
                                      )
                                    ]))),
                  ]))
        ])));
  }
}
