import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Papel_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/home.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/camera.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/newspaper.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/pin.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/images/icons/planet-ecologic.png')),
              label: ''),
        ],
      ),
    );
  }
}
