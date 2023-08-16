import 'package:flutter/material.dart';
import 'package:recycle_view/views/bemvindo_page.dart';
import 'package:recycle_view/views/inteligencia_artificial.dart';
import 'package:recycle_view/views/noticias.dart';
import 'package:recycle_view/views/pontos.dart';

import 'educacao_ambiental_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _telas = [
    BemVindoPage(),
    InteligenciaArtificial(),
    Noticias(),
    PontosPage(),
    EducacaoAmbientalPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: _telas[_selectedIndex],
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
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Color.fromARGB(255, 89, 165, 128),
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/icons/home.png',
                  ),
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/camera.png'),
                    size: 35,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/newspaper.png'),
                    size: 30,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/pin.png'),
                    size: 30,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/planet-earth.png'),
                    size: 35,
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
