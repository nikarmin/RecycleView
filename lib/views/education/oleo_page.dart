import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OleoPage extends StatelessWidget {
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
                Image.asset(
                  'assets/images/wave_oleo.png',
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
                                  size: 8,
                                  color: Color.fromARGB(255, 246, 188, 43)),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  A reciclagem pode ser em casa ou em um ponto de coleta;",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16))
                        ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8,
                                  color: Color.fromARGB(255, 246, 188, 43)),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  O ideal é ser armazenado já frio em garrafas PET (garrafas de vidro podem quebrar!);",
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
                                  size: 8,
                                  color: Color.fromARGB(255, 246, 188, 43)),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Através da reciclagem pode produzir sabão, ração animal, tinta, adesivos, detergente, glicerina, lubrificantes e muitos outros.",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)))
                        ])),
                      ),
                    ]),
                SizedBox(height: 20),
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
                                    "Através da reciclagem de óleo de cozinha temos um menor impacto ambiental, pois, o óleo é altamente poluente e ses descarte incorreto é capaz de gerar uma série de malefícios ao meio ambiente, como a impermeabilização e a contaminação do solo, entupimento de redes de esgoto e poluição dos lençóis freáticos, além de em sua decomposição produzir gás metano, gás inodoro e incolor, que é emitido na atmosfera, formando uma mistura altamente explosiva.",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                    ]),
                SizedBox(height: 20)
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
