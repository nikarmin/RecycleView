import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlasticoPage extends StatelessWidget {
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
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  'assets/images/wave_plastico.png',
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
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: "  Coleta Seletiva;",
                              style: GoogleFonts.jost(
                                  textStyle: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 17))))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Separar os plásticos recicláveis para descarte;",
                              style: GoogleFonts.jost(
                                  textStyle: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 17))))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Recipientes em geral dever ser higienizados para evitar a proliferação de micro-organismos e pragas;",
                              style: GoogleFonts.jost(
                                  textStyle: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 17))))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Embalagens e recipientes secos, não precisam ser lavados.",
                              style: GoogleFonts.jost(
                                  textStyle: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 17))))
                        ])),
                      ),
                    ]),
                const SizedBox(height: 35),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 15, right: 25),
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
                                    "Através da reciclagem do plástico temos um menor impacto ambiental, pois, sem ela são inúmeros os impactos causados, como exemplo, toneladas de plástico são descartadas nos oceanos todos os anos, causando a morte de animais marinhos pela ingestão de microplásticos, remos a proliferação de plástico em aterros sanitários, contaminando assim, a água dos rios e lençóis freáticos e muitos outros. ",
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
                            child: Text('Frascos',
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
                            child: Text('Potes de alimento',
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
                            child: Text('Recipientes',
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
                            child: Text('Garrafas PET',
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
                            child: Text('Utilidades domésticas',
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
                            child: Text('Sacos',
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
                            child: Text('Tubos e conexões de pvc',
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
                            child: Text('Copos',
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
                            child: Text('Isopor',
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
                            child: Text('Sacolas',
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
                            child: Text('Embalagens de alimentos',
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
                            child: Text('Peças de brinquedos',
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
                            child: Text('Escova de dente',
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
                            child: Text('Caneta esferográfica',
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
                            child: Text('Cabos de panela',
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
                            child: Text('Tomadas',
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
                            child: Text('Espuma',
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
                            child: Text('Adesivos',
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
                            child: Text('Teclados de computador',
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
                            child: Text('Acrilíco',
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
                            child: Text('Celofane',
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
                            child: Text('Esponja',
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
                            child: Text('Embalagens metalizadas',
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
                            child: Text('Fraldas descartáveis',
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
                            child: Text('Absorventes higiênicos',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
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
