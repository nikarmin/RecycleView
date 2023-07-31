import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PapelPage extends StatelessWidget {
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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/papel_page.png'),
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
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Color.fromARGB(255, 89, 165, 128),
                onTap: (value) {},
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icons/home.png',
                      ),
                      size: 50,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/camera.png'),
                        size: 50,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/newspaper.png'),
                        size: 50,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/pin.png'),
                        size: 50,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/planet-ecologic.png'),
                        size: 50,
                      ),
                      label: ''),
                ],
              ),
            ),
          ),
        ));
  }
}
