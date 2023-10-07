import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VidroPage extends StatelessWidget {
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
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage('assets/images/background/vidro_page.png')),
          // ),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  'assets/images/wave_vidro.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 20),
                //SizedBox(height: 190),
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
                                  size: 8,
                                  color: Color.fromARGB(255, 24, 87, 28)),
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
                                  size: 8,
                                  color: Color.fromARGB(255, 24, 87, 28)),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Separar os vidros recicláveis para descarte;",
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
                                  size: 8,
                                  color: Color.fromARGB(255, 24, 87, 28)),
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
                                  size: 8,
                                  color: Color.fromARGB(255, 24, 87, 28)),
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
                                  size: 8,
                                  color: Color.fromARGB(255, 24, 87, 28)),
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
                                  size: 8,
                                  color: Color.fromARGB(255, 24, 87, 28)),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Retire das embalagens rótulos e acessórios de papel ou plástico, se houver;",
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
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text: "ATENÇÃO",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 24, 87, 28),
                                        fontSize: 17)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "No caso do vidro, se estiver quebrado, é preciso ter um cuidado extra e fazer uma “embalagem especial” para não ferir os trabalhadores que vierem a manuseá-lo. Se os cacos de vidro forem pequenos, você pode colocá-los dentro de uma garrafa PET, caixa de papelão ou jornal. Lembre-se de escrever ou colar um papel onde informe que ali contém vidro, assim, ninguém se machucará ao manusear.",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                    ]),
                const SizedBox(height: 20),
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
                                    "Através da reciclagem do vidro temos um menor impacto ambiental, pois, os vidros não são biodegradáveis e permanecem na natureza por cerca de dez mil anos, por isso a importância do descarte correto.",
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
                            child: Text('Potes',
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
                            child: Text('Frascos em geral',
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
                            child: Text('Garrafas',
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
                            child: Text('Embalagens',
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
                            child: Text('Cacos',
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
                            child: Text('Espelho',
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
                            child: Text('Cristal',
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
                            child: Text('Ampolas de medicamentos',
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
                            child: Text('Louças',
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
                            child: Text('Cerâmicas',
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
                            child: Text('Lâmpadas',
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
                            child: Text('Vidros temperados planos',
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
                            child: Text('Tubos de televisão',
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
                            child: Text('Vidros de janelas de automóveis',
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
                            child: Text('Utensílios domésticos',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    const SizedBox(width: 2),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
