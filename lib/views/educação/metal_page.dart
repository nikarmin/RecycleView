import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetalPage extends StatelessWidget {
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
                  'assets/images/wave_metal.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.amber),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: "  Coleta Seletiva;",
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
                                  size: 8, color: Colors.amber),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Separar os metais recicláveis para descarte;",
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
                                  size: 8, color: Colors.amber),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Recipientes em geral dever ser higienizados para evitar a proliferação de micro-organismos e pragas;",
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
                                  size: 8, color: Colors.amber),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Esses recipientes dever estar sempre vazios;",
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
                                  size: 8, color: Colors.amber),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Embalagens e recipientes secos, não precisam ser lavados;",
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
                                  size: 8, color: Colors.amber),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Retire das embalagens rótulos e acessórios de papel ou plástico, se houver.",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                    ]),
                const SizedBox(height: 35),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text: "IMPACTOS AMBIENTAIS",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "Através da reciclagem de metais temos um menor impacto ambiental, pois, ao contrário de outros materiais, os metais podem ser reciclados infitas vezes sem perderem suas propriedades, ou seja, uma simples peça de lata pode se tornar muitas outras coisas, desde uma panela a uma peça de avião, além disso, outro beneficio da reciclagem é redução de extração de minérios, extração essa que pode levar a destruição de vegetações, poluição de rios e ar, risco de rompimento de barragens e muitos outros. ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                    ]),
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
                                  text: "RECICLÁVEIS",
                                  style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)))),
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
                            child: Text('Latas de alumínio e aço',
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
                            child: Text('Tampas',
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
                            child: Text('Ferragens',
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
                            child: Text('Esquadrias',
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
                            child: Text('Canos',
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
                            child: Text('Molduras de quadros',
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
                            child: Text('Latas de alimento',
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
                            child: Text('Alumínio',
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
                            child: Text('Tampa de iogurte',
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
                            child: Text('Folhas de alumínio',
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
                            child: Text('Cápsulas de café',
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
                            child: Text('Arame',
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
                            child: Text('Fio de cobre',
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
                            child: Text('Panela sem cabo',
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)))),
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
                            child: Text('Clipes',
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
                            child: Text('Grampos',
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
                            child: Text('Esponjas de aço',
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
                            child: Text('Latas de tinta e verniz',
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
                            child: Text('Latas de aerossol',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
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
