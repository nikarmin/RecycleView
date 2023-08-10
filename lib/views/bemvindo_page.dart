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
    BemVindoPage(),
    Noticias(),
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
        color: Color.fromRGBO(233, 233, 233, 1),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text.rich(TextSpan(
                    text: 'Bem-vindo ao ',
                    style: GoogleFonts.archivo(
                      textStyle: TextStyle(
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
                            textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1.9,
                                color: Color.fromRGBO(71, 123, 48, 1)),
                          ))
                    ])),
              ),
              Image.asset('assets/images/icons/logo-recycleview.png'),
              Padding(
                padding:
                    const EdgeInsets.only(left: 38.0, right: 38.0, top: 15),
                child: Text(
                  'RecycleView é um aplicativo que reúne diversas informações sobre reciclagem e coleta seletiva em um só lugar! Você tem diversas funcionalidades a seres exploradas! Veja abaixo:',
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(fontSize: 18, color: Colors.black)),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/camera-noblur.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Identificar objetos       ',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/newspaper-noblur.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Notícias de reciclagem',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/pin-noblur.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Pontos de coleta         ',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 25, right: 25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/planet-ecologic-noblur.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Educação Ambiental   ',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Perfil();
              }));
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(30),
      //       topLeft: Radius.circular(30),
      //     ),
      //     boxShadow: [
      //       BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30.0),
      //       topRight: Radius.circular(30.0),
      //     ),
      //     child: BottomNavigationBar(
      //       currentIndex: _selectedIndex,
      //       type: BottomNavigationBarType.fixed,
      //       showSelectedLabels: false,
      //       showUnselectedLabels: false,
      //       selectedItemColor: Color.fromARGB(255, 89, 165, 128),
      //       onTap: _onItemTapped,
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: ImageIcon(
      //             AssetImage(
      //               'assets/images/icons/home.png',
      //             ),
      //             size: 50,
      //           ),
      //           label: '',
      //         ),
      //         BottomNavigationBarItem(
      //             icon: ImageIcon(
      //               AssetImage('assets/images/icons/camera.png'),
      //               size: 50,
      //             ),
      //             label: ''),
      //         BottomNavigationBarItem(
      //             icon: ImageIcon(
      //               AssetImage('assets/images/icons/newspaper.png'),
      //               size: 50,
      //             ),
      //             label: ''),
      //         BottomNavigationBarItem(
      //             icon: ImageIcon(
      //               AssetImage('assets/images/icons/pin.png'),
      //               size: 50,
      //             ),
      //             label: ''),
      //         BottomNavigationBarItem(
      //             icon: ImageIcon(
      //               AssetImage('assets/images/icons/planet-ecologic.png'),
      //               size: 50,
      //             ),
      //             label: ''),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
