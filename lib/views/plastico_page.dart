import 'package:flutter/material.dart';

class PlasticoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/plastico_page.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(                                           
          topLeft: Radius.circular(30.0),                                            
          topRight: Radius.circular(30.0),),
          child: BottomNavigationBar(
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Color.fromARGB(255, 89, 165, 128),
            onTap: (value) {
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icons/home.png',), size: 50,),
                  label: '',),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icons/camera.png'), size: 50,),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icons/newspaper.png'), size: 50,),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icons/pin.png'), size: 50,),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icons/planet-ecologic.png'), size: 50,),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
  
}