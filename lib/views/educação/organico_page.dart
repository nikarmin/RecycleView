import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganicoPage extends StatelessWidget {
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
                  'assets/images/wave_organico.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: RichText(
                            text: TextSpan(
                                text: "O QUE É",
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
                                    "Resíduos orgânicos são quaisquer resíduos que tenham origem vegetal ou animal, como restos de alimentos e outros materiais que degradam rapidamente na natureza, tais como: cascas, folhas, restos frutos e vegetais, pó de café, esterco de animais, aparas de gramas, galhos, papel, restos de culturas agrícolas, etc.",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, bottom: 15, right: 25),
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
                            left: 25, bottom: 10, right: 25, top: 5),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    "Existem duas formas de reciclar o lixo orgânico: pela compostagem, gerando adubo para ser utilizado em hortas, vasos de plantas, jardins ou algum terreno que você tenha disponível, e a produção de biogás. A principal forma usada é a compostagem, processo esse que envolve a decomposição biológica através de micro-organismos do solo que têm na matéria orgânica sua fonte de energia, nutrientes, minerais e carbono, assim degradando a matéria orgânica e disponibilizando nutrientes para as plantas.",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 17)))),
                      ),
                      const SizedBox(height: 20),
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
                                    "Através da reciclagem da matéria orgânica temos um menor impacto ambiental, pois, diminuímos o impacto nos aterros sanitários onde a matéria orgânica ao se decompor libera gás metano, um grande contribuinte no aquecimento global, e chorume que em grande quantidade pode contaminar o solo e os lençóis freáticos além de atrair vetores de doenças como leptospirose, malária e febre amarela se não for descartado corretamente.",
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
                                  text: "PODE SER COMPOSTADO",
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
                            child: Text(
                                'Restos e cascas de frutas, legumes e verduras',
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
                            child: Text('Saquinho de chá',
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
                            child: Text('Bagaço de cana',
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
                            child: Text('Esterco de animais herbívoros',
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
                            child: Text('Pó de café',
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
                            child: Text('Coador de papel',
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
                            child: Text('Aparas de plantas',
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
                            child: Text('Serragem',
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
                            child: Text('Folhas secas',
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
                            child: Text('Cascas de árvores',
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
                                  text: "NÃO PODE SER COMPOSTADO",
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
                            child: Text(
                                'Madeira tratada com pesticida ou verniz',
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
                            child: Text('Sementes',
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
                            child: Text('Poda de ervas invasoras',
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
                            child: Text('Leite e seus derivados',
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
                            child: Text('Vegetais doentes',
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
                            child: Text('Alimentos cozidos ou salgados',
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
                            child: Text('Ossos',
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
                            child: Text('Restos de carne',
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
                            child: Text('Cebolas doentes',
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
