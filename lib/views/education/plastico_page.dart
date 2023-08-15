import 'package:flutter/material.dart';

class PlasticoPage extends StatelessWidget {
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
            onPressed: () {},
          ),
        ],
      ),
/////////////////////////////////////////////////////////////////////////////
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    AssetImage('assets/images/background/plastico_page.png')),
          ),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SizedBox(height: 180),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 25, bottom: 15),
                        child: RichText(
                            text: TextSpan(
                                text: "COMO DESCARTAR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 5, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.circle,
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: "  Coleta Seletiva;",
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
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Separar os plásticos recicláveis para descarte;",
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
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Recipientes em geral dever ser higienizados para evitar a proliferação de micro-organismos e pragas;",
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
                                  size: 8, color: Colors.red),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Embalagens e recipientes secos, não precisam ser lavados.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16))
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
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 10, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "Através da reciclagem do plástico temos um menor impacto ambiental, pois, sem ela são inúmeros os impactos causados, como exemplo, toneladas de plástico são descartadas nos oceanos todos os anos, causando a morte de animais marinhos pela ingestão de microplásticos, remos a proliferação de plástico em aterros sanitários, contaminando assim, a água dos rios e lençóis freáticos e muitos outros. ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))),
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
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
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
                            child: Text('Tampas',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Frascos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Potes de alimento',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Recipientes',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Garrafas PET',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Utilidades domésticas',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Sacos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Tubos e conexões de pvc',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Copos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Isopor',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Sacolas',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Embalagens de alimentos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Peças de brinquedos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Escova de dente',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Caneta esferográfica',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
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
                            child: Text('Cabos de panela',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Tomadas',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Espuma',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Adesivos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Teclados de computador',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Acrilíco',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Esponja',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Embalagens metalizadas',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
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
                            child: Text('Fraldas descartáveis',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Absorventes higiênicos',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)))),
                    SizedBox(width: 2),
                  ],
                ),
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
