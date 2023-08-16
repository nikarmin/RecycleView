import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle_view/views/education/plastico_page.dart';

class EducacaoAmbientalPage extends StatelessWidget {
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
              AssetImage('assets/images/icons/loupe.png'),
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
/////////////////////////////////////////////////////////////////////////////
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: AssetImage('assets/images/background/pageuau.png')),
        // ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 150,
              //   width: 250,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/ed_ambiental.png'),
              //         fit: BoxFit.contain),
              //   ),
              // ),
              SizedBox(height: 5),
              Column(children: [
                Container(
                    child: Image.asset(
                  'assets/images/image_education.png',
                  height: 150,
                  width: 250,
                )),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, bottom: 5, right: 0, top: 10),
                  child: Text(
                    'EDUCAÇÃO AMBIENTAL',
                    style: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  // child: Text("Educação Ambiental",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 30,
                  //         color: Colors.black),
                  //     textAlign: TextAlign.center),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 18, bottom: 5, right: 18, top: 0),
                  child: Text(
                    '"Entendem-se por educação ambiental os processos por meio dos quais o indivíduo e a coletividade constroem valores sociais, conhecimentos, habilidades, atitudes e competências voltadas para a conservação do meio ambiente, bem de uso comum do povo, essencial à sadia qualidade de vida e sua sustentabilidade." Política Nacional de Educação Ambiental - Lei nº 9795/1999, Art 1º.',
                    style: GoogleFonts.jost(
                        textStyle:
                            TextStyle(fontSize: 18, color: Colors.black)),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Colors.lightBlueAccent,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "PAPEL ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/paper-plane.png'),
                            color: Colors.white,
                            size: 30,
                          ))
                        ])),
                        subtitle: Text(
                            "\nJornais, revistas, caixas de papelão...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlasticoPage()));
                  },
                  child: const Card(
                      color: Colors.red,
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "PLÁSTICO ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30)),
                            WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/plastic-bottle.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text(
                              "\nGarrafas PET, embalagens, sacolas...",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Colors.amber,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "METAL ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/metals.png'),
                            color: Colors.white,
                            size: 30,
                          ))
                        ])),
                        subtitle: Text("\nLatas, materiais de alumínio...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Color.fromARGB(255, 24, 87, 28),
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "VIDRO ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/bottle.png'),
                            color: Colors.white,
                            size: 30,
                          ))
                        ])),
                        subtitle: Text("\nGarradas, copos, potes de vidro...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Colors.grey,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "MATERIAIS ELETRÔNICOS ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/light-bulb.png'),
                            color: Colors.white,
                            size: 25,
                          ))
                        ])),
                        subtitle: Text("\nCelulares, computadores, pilhas...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Color.fromARGB(255, 246, 188, 43),
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "ÓLEO ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/oil-bottle.png'),
                            color: Colors.white,
                            size: 30,
                          ))
                        ])),
                        subtitle: Text("\nÓleo de cozinha...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Color.fromARGB(255, 72, 47, 42),
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "ORGÂNICOS ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/apple.png'),
                            color: Colors.white,
                            size: 30,
                          ))
                        ])),
                        subtitle: Text(
                            "\nRestos de alimentos, folhas, sementes, restos de carne...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Colors.white,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "RESÍDUOS HOSPITALARES ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/syringe-outline.png'),
                            color: Colors.black,
                            size: 25,
                          ))
                        ])),
                        subtitle: Text(
                            "\nAgulhas, seringas, algodões, bisturis...",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: const Card(
                    color: Color.fromARGB(255, 123, 31, 162),
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "RESÍDUOS RADIOATIVOS ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25)),
                          WidgetSpan(
                              child: ImageIcon(
                            AssetImage(
                                'assets/images/icons_materials/radiation.png'),
                            color: Colors.white,
                            size: 25,
                          ))
                        ])),
                        subtitle: Text(
                            "\nResíduos utilizados em usinas nucleares...",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),
            ],
          ),
        ),
      ),
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
