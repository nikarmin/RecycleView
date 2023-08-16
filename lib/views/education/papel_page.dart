import 'package:flutter/material.dart';

class Aapaper extends StatelessWidget {
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
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage('assets/images/background/papel_page.png')),
          // ),
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
                                  size: 8, color: Colors.lightBlueAccent),
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
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Separar os papéis recicláveis para descarte;",
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
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Não incluir papeis sujos, engordurados, encerados ou plastificados;",
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
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Guardanapos e papel higiênico, ainda que limpos, não são recicláveis;",
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
                                  size: 8, color: Colors.lightBlueAccent),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text:
                                  "  Para o transporte de papel, o ideal é não amassá-lo, para não afetar as fibras da celulose, nem deteriorar o valor comercial para reciclagem.",
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
                                    "Através da reciclagem do papel temos um menor impacto ambiental, pois, a fabricação do papel afeta o meio ambiente de várias maneiras, com emissões de gases do efeito estufa, desmatamento em massa de florestas e poluição da água e ar. ",
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
                            child: Text('Jornais',
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
                            child: Text('Revistas',
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
                            child: Text('Cadernos',
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
                            child: Text('Apostilas',
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
                            child: Text('Caixas',
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
                            child: Text('Sacos de papel',
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
                            child: Text('Papelão',
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
                            child: Text('Cartões',
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
                            child: Text('Envelopes',
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
                            child: Text('Livros',
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
                            child: Text('Cartolinas',
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
                            child: Text('Folhas de caderno',
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
                            child: Text('Folhetos',
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
                            child: Text('Adesivos',
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
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        margin: EdgeInsets.all(4),
                        elevation: 7,
                        shadowColor: Colors.black,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Etiquetas',
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
                            child: Text('Fita crepe',
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
                            child: Text('Papel carbono',
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
                            child: Text('Papéis de extrato bancário',
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
                            child: Text('Fotografias',
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
                            child: Text('Papel vegetal',
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
                            child: Text('Papéis metalizados',
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
                            child: Text('Papel toalha',
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
                            child: Text('Papel higiênico',
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
                            child: Text('Fotografias',
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
                            child: Text('Papel vegetal',
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
                            child: Text('Papéis metalizados',
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
