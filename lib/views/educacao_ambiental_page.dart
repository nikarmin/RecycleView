import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle_view/views/bemvindo_page.dart';
import 'package:recycle_view/views/educa%C3%A7%C3%A3o/materiais_eletronicos_page.dart';
import 'package:recycle_view/views/educa%C3%A7%C3%A3o/metal_page.dart';
import 'package:recycle_view/views/educa%C3%A7%C3%A3o/oleo_page.dart';
import 'package:recycle_view/views/educa%C3%A7%C3%A3o/organico_page.dart';
import 'package:recycle_view/views/educa%C3%A7%C3%A3o/plastico_page.dart';

import 'package:recycle_view/views/educa%C3%A7%C3%A3o/papel_page.dart';
import 'package:recycle_view/views/educa%C3%A7%C3%A3o/vidro_page.dart';
import 'package:recycle_view/views/home_screen.dart';
import 'package:recycle_view/views/perfil_page.dart';

class EducacaoAmbientalPage extends StatefulWidget {
  const EducacaoAmbientalPage({super.key});

  @override
  State<EducacaoAmbientalPage> createState() => _EducacaoAmbientalPageState();
}

class _EducacaoAmbientalPageState extends State<EducacaoAmbientalPage> {
  TextEditingController _search = TextEditingController();

  final reciclaveis = [
    "papel",
    "jornal",
    "revista",
    "caderno",
    "apostila",
    "caixa de papelão",
    "saco de papel",
    "papelão",
    "papel cartão",
    "envelope",
    "livro",
    "cartolina",
    "folhas de caderno",
    "folheto",
    "plástico",
    "tampa de plástico",
    "frasco de plástico",
    "pote de alimento",
    "recipiente de plástico",
    "pote de plástico",
    "garrafa pet",
    "utilidade doméstica",
    "saco de plástico",
    "tubo e conexão pvc",
    "pvc",
    "copo de plástico",
    "isopor",
    "sacola",
    "embalagem de alimento",
    "embalagem",
    "peça de brinquedo",
    "escova de dente",
    "caneta esferográfica",
    "metal",
    "lata de alumínio",
    "lata de aço",
    "tampa de metal",
    "ferragens",
    "esquadrias",
    "cano de metal",
    "moldura de quadro de metal",
    "lata de alimento",
    "alumínio",
    "tampa de iogurte",
    "folha de alumínio",
    "cápsula de café",
    "arame",
    "fio de cobre",
    "panela sem cabo",
    "vidro",
    "tampa de vidro",
    "pote de vidro",
    "frasco de vidro",
    "copo de vidro",
    "garrafa de vidro",
    "caco de vidro",
    "lâmpada fluorescente",
    "lâmpada economizadadora",
    "lâmpada de descarga",
    "lâmpada led",
    "luminária"
  ];

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
                return const Perfil();
              }));
            },
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
              const SizedBox(height: 15),
              Column(children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.1,
                    child: SearchAnchor(
                      viewBackgroundColor:
                          const Color.fromRGBO(243, 243, 243, 1),
                      viewSurfaceTintColor:
                          const Color.fromRGBO(243, 243, 243, 1),
                      dividerColor: const Color.fromRGBO(243, 243, 243, 1),
                      isFullScreen: false,
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(243, 243, 243, 1)),
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
                            icon: const Icon(Icons.search, color: Colors.grey),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          textStyle: MaterialStateProperty.all(GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  fontSize: 17, color: Colors.black))),
                          hintText: 'Jornais, papéis, pilhas...',
                          hintStyle: MaterialStateProperty.all(GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  fontSize: 17, color: Colors.black))),
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(reciclaveis.length,
                            (int index) {
                          return ListTile(
                            title: Text(reciclaveis[index]),
                            onTap: () {
                              setState(() {
                                controller.closeView(reciclaveis[index]);
                              });
                            },
                          );
                        });
                      },
                    )),
                Image.asset(
                  'assets/images/image_education.png',
                  height: 150,
                  width: 250,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, bottom: 20, right: 0, top: 20),
                  child: Text(
                    'EDUCAÇÃO AMBIENTAL',
                    style: GoogleFonts.jost(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, bottom: 5, right: 18, top: 0),
                  child: Text(
                    '"Entendem-se por educação ambiental os processos por meio dos quais o indivíduo e a coletividade constroem valores sociais, conhecimentos, habilidades, atitudes e competências voltadas para a conservação do meio ambiente, bem de uso comum do povo, essencial à sadia qualidade de vida e sua sustentabilidade." Política Nacional de Educação Ambiental - Lei nº 9795/1999, Art 1º.',
                    style: GoogleFonts.jost(
                        textStyle:
                            const TextStyle(fontSize: 18, color: Colors.black)),
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "PAPEL ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
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
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "PLÁSTICO ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
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
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "METAL ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/metals.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text("\nLatas, materiais de alumínio...",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                      color: const Color.fromARGB(255, 24, 87, 28),
                      elevation: 7,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "VIDRO ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/bottle.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text("\nGarradas, copos, potes de vidro...",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "MATERIAIS ELETRÔNICOS ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/light-bulb.png'),
                              color: Colors.white,
                              size: 25,
                            ))
                          ])),
                          subtitle: Text("\nCelulares, computadores, pilhas...",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                      color: const Color.fromARGB(255, 246, 188, 43),
                      elevation: 7,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "ÓLEO ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
                                child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons_materials/oil-bottle.png'),
                              color: Colors.white,
                              size: 30,
                            ))
                          ])),
                          subtitle: Text("\nÓleo de cozinha...",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
                      color: const Color.fromARGB(255, 72, 47, 42),
                      elevation: 7,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: ListTile(
                          title: Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "\n", style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: "ORGÂNICOS ",
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            const WidgetSpan(
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
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
