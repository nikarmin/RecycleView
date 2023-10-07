import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle_view/views/noticias.dart';
import 'package:recycle_view/views/perfil_page.dart';

class BemVindoPage extends StatefulWidget {
  const BemVindoPage({super.key});

  @override
  State<BemVindoPage> createState() => _BemVindoPageState();
}

class _BemVindoPageState extends State<BemVindoPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const BemVindoPage(),
    const Noticias(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(233, 233, 233, 1),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text.rich(TextSpan(
                    text: 'Bem-vindo ao ',
                    style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.9,
                        color: Colors.black,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'RecycleView!',
                          style: GoogleFonts.archivo(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1.9,
                                color: Color.fromRGBO(71, 123, 48, 1)),
                          ))
                    ])),
              ),
              Image.asset(
                'assets/images/icons/logo.png',
                height: 200,
                width: 200,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 38.0, right: 38.0, top: 15),
                child: Text(
                  'RecycleView é um aplicativo que reúne diversas informações sobre reciclagem e coleta seletiva em um só lugar! Você tem diversas funcionalidades a seres exploradas! Veja abaixo:',
                  style: GoogleFonts.jost(
                      textStyle: const TextStyle(fontSize: 18, color: Colors.black)),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/camera.png',
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Identificar objetos       ',
                            style: GoogleFonts.jost(
                                textStyle: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/newspaper.png',
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Notícias de reciclagem',
                            style: GoogleFonts.jost(
                                textStyle: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/pin.png',
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Pontos de coleta         ',
                            style: GoogleFonts.jost(
                                textStyle: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/earth-day.png',
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Educação Ambiental   ',
                            style: GoogleFonts.jost(
                                textStyle: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        leading: const Icon(
          Icons.waving_hand_rounded,
          color: Colors.black,
        ),
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
      backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
    );
  }
}
