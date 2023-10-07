import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatEletronicosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/icons/account.png'),
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
/////////////////////////////////////////////////////////////////////////////
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  'assets/images/wave_eletro.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 20, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "RESÍDUOS ELETRÔNICOS: COMPUTADORES, PILHAS, BATERIAS...",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text: "RECICLAGEM",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 0),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "O processo de reciclagem desses materiais começa nos pontos de coleta de lixo eletrônico. ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 0),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "Conheça os diversos pontos de coleta espalhados por aí através do nosso aplicativo!",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                    ]),
                const SizedBox(height: 25),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: RichText(
                            text: TextSpan(
                                text: "COMO DESCARTAR",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Jamais descarte produtos eletrônicos juntamente com o lixo residencial, esse tipo de resíduo contém substâncias tóxicas que contaminam o solo e a água;",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Pilhas e baterias: armazená-las separadamente de outros materiais e envolvê-las em plásticos resistentes, assim evitamos possíveis vazamentos;",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Consulte em nosso aplicativos quais são os pontos de coleta mais próximos de você.",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                    ]),
                const SizedBox(height: 30),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: RichText(
                            text: const TextSpan(
                                text: "LÂMPADAS",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 10),
                        child: RichText(
                            text: TextSpan(
                                text: "COMO DESCARTAR",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Nunca se devem descartar lâmpadas em junto da reciclagem de vidro. Uma vez que contêm materiais diferentes, devem ser tratados de forma diferente.",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Nem todas as lâmpadas são recicladas da mesma forma, algumas nem sequer são recicláveis. Consulte em nosso aplicativos quais são os pontos de coleta mais próximos de você",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Consulte em nosso aplicativos quais são os pontos de coleta mais próximos de você",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                    ]),
                const SizedBox(height: 20),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 10, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text: "IMPACTO AMBIENTAL",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 0, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "A reciclagem de lâmpadas é uma prática fundamental para minimizar os impactos no meio ambiente e proteger a saúde pública.",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 0),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "Ao serem descartadas no lixo comum, cresce o risco de contaminação do solo, água, plantas e seres vivos pelo mercúrio. Ao realizar a reciclagem dessas lâmpadas, você contribui para a conservação de recursos naturais, a redução da poluição e a promoção de um ambiente mais sustentável.",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                    ]),
                const SizedBox(height: 15),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, bottom: 15),
                          child: RichText(
                              text: TextSpan(
                                  text: "RECICLÁVEIS",
                                  style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))),
                        ),
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text('Fluorescentes',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text('Economizadores',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text('De descarga',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text("LED'S",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text('Luminárias',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, bottom: 15),
                          child: RichText(
                              text: TextSpan(
                                  text: "NÃO RECICLÁVEIS",
                                  style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))),
                        ),
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text('Lâmpadas de filamentos',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: const EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text('Halogéneo',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                  ],
                ),
                const SizedBox(height: 20),
              ]))),

/////////////////////////////////////////////////////////////////////////////
      backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
          ],
        ),
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
