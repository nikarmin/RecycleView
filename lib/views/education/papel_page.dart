import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PapelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
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
                // SizedBox(height: 160),
                Image.asset(
                  'assets/images/wave_papel.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 25, bottom: 15),
                        child: RichText(
                            text: TextSpan(
                                text: "COMO DESCARTAR",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: "  Coleta Seletiva;",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Separar os papéis recicláveis para descarte;",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Não incluir papeis sujos, engordurados, encerados ou plastificados;",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Guardanapos e papel higiênico, ainda que limpos, não são recicláveis;",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Para o transporte de papel, o ideal é não amassá-lo, para não afetar as fibras da celulose, nem deteriorar o valor comercial para reciclagem.",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                    ]),
                SizedBox(height: 35),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text: "IMPACTOS AMBIENTAIS",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "Através da reciclagem do papel temos um menor impacto ambiental, pois, a fabricação do papel afeta o meio ambiente de várias maneiras, com emissões de gases do efeito estufa, desmatamento em massa de florestas e poluição da água e ar. ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                    ]),
                SizedBox(height: 20),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25, bottom: 15),
                          child: RichText(
                              text: TextSpan(
                                  text: "RECICLÁVEIS",
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
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
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Jornais',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Revistas',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Cadernos',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Apostilas',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Caixas',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Sacos de papel',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papelão',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Cartões',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Envelopes',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Livros',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Cartolinas',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Folhas de caderno',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Folhetos',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25, bottom: 15),
                          child: RichText(
                              text: TextSpan(
                                  text: "NÃO RECICLÁVEIS",
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
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
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Adesivos',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Celofane',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Etiquetas',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Fita crepe',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papel carbono',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papéis de extrato bancário',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Fotografias',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papel vegetal',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papéis metalizados',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papel toalha',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papel higiênico',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Fotografias',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papel vegetal',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Papéis metalizados',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 15))))),
                    SizedBox(width: 2),
                  ],
                ),
                SizedBox(height: 20),
              ]))),

/////////////////////////////////////////////////////////////////////////////
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
