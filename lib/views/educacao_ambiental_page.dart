import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle_view/views/bemvindo_page.dart';
import 'package:recycle_view/views/education/materiais_eletronicos_page.dart';
import 'package:recycle_view/views/education/metal_page.dart';
import 'package:recycle_view/views/education/oleo_page.dart';
import 'package:recycle_view/views/education/organico_page.dart';
import 'package:recycle_view/views/education/plastico_page.dart';

import 'package:recycle_view/views/education/papel_page.dart';
import 'package:recycle_view/views/education/vidro_page.dart';
import 'package:recycle_view/views/home_screen.dart';
import 'package:recycle_view/views/perfil_page.dart';

class EducacaoAmbientalPage extends StatefulWidget {
  const EducacaoAmbientalPage({super.key});

  @override
  State<EducacaoAmbientalPage> createState() => _EducacaoAmbientalPageState();
}

class _EducacaoAmbientalPageState extends State<EducacaoAmbientalPage> {
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/icons/account.png'),
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Perfil();
              }));
            },
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
              SizedBox(height: 15),
              Column(children: [
                Container(
                    width: MediaQuery.sizeOf(context).width / 1.1,
                    child: SearchAnchor(
                      viewBackgroundColor: Color.fromRGBO(243, 243, 243, 1),
                      viewSurfaceTintColor: Color.fromRGBO(243, 243, 243, 1),
                      dividerColor: Color.fromRGBO(243, 243, 243, 1),
                      isFullScreen: false,
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(243, 243, 243, 1)),
                          shadowColor: MaterialStateProperty.all(
                              Colors.black.withOpacity(0.2)),
                          controller: controller,
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: IconButton(
                            icon: Icon(Icons.search, color: Colors.grey),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          textStyle: MaterialStateProperty.all(GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 17, color: Colors.black))),
                          hintText: 'Jornais, papéis, pilhas...',
                          hintStyle: MaterialStateProperty.all(GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 17, color: Colors.black))),
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'arrumar... $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      },
                    )),
                //   child: TextField(
                //     controller: _search,
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Color.fromRGBO(243, 243, 243, 1),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(50),
                //           borderSide: BorderSide(
                //             style: BorderStyle.none,
                //             width: 0,
                //           )),
                //       prefixIcon: IconButton(
                //         icon: Icon(Icons.search, color: Colors.grey),
                //         onPressed: () {
                //           // Perform the search here
                //         },
                //       ),
                //       suffixIcon: IconButton(
                //         icon: Icon(Icons.clear, color: Colors.grey),
                //         onPressed: () => _search.clear(),
                //       ),
                //       hintText: 'Jornais, papéis, pilhas...',
                //       hintStyle: GoogleFonts.jost(
                //           textStyle:
                //               TextStyle(fontSize: 17, color: Colors.black)),
                //     ),
                //   ),
                // ),
                Container(
                    child: Image.asset(
                  'assets/images/image_education.png',
                  height: 150,
                  width: 250,
                )),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, bottom: 20, right: 0, top: 20),
                  child: Text(
                    'EDUCAÇÃO AMBIENTAL',
                    style: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
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
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PapelPage()));
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                  height: 150,
                  child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "PAPEL ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
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
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
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
                  child: Card(
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
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
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
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MetalPage()));
                  },
                  child: Card(
                      color: Colors.amber,
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "METAL ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/metals.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text("\nLatas, materiais de alumínio...",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VidroPage()));
                  },
                  child: Card(
                      color: Color.fromARGB(255, 24, 87, 28),
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "VIDRO ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/bottle.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text("\nGarradas, copos, potes de vidro...",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 170,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MatEletronicosPage()));
                  },
                  child: Card(
                      color: Colors.grey,
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "MATERIAIS ELETRÔNICOS ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/light-bulb.png'),
                              color: Colors.white,
                              size: 25,
                            ))
                          ])),
                          subtitle: Text("\nCelulares, computadores, pilhas...",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OleoPage()));
                  },
                  child: Card(
                      color: Color.fromARGB(255, 246, 188, 43),
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "ÓLEO ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/oil-bottle.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text("\nÓleo de cozinha...",
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 160,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrganicoPage()));
                  },
                  child: Card(
                      color: Color.fromARGB(255, 72, 47, 42),
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "ORGÂNICOS ",
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
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
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: Icon(Icons.arrow_forward_ios),
                          iconColor: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              /*
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                height: 150,
                child: Card(
                    color: Colors.white,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ListTile(
                        title: Text.rich(TextSpan(children: [
                          TextSpan(text: "\n", style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: "RESÍDUOS HOSPITALARES ",
                              style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .white))),
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
                                GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 17))),
                        trailing: Icon(Icons.arrow_forward_ios),
                        iconColor: Colors.white)),
              ),*/
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
