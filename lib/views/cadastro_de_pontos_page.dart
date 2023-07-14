import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroDePontosPage extends StatelessWidget {
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nome do ponto',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                    TextField(),
                    Text('CEP',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black))),
                    TextField(),
                    Text('Número',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black))),
                    TextField(),
                    Text('O que esse ponto recolhe?',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black))),
                    CheckboxListTile(
                      title: Text('Óleo'),
                      value: false,
                      onChanged: (value) {},
                    ),
                    CheckboxListTile(
                      title: Text('Eletrônicos'),
                      value: false,
                      onChanged: (value) {},
                    ),
                    CheckboxListTile(
                      title: Text('Recicláveis'),
                      value: false,
                      onChanged: (value) {},
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('CADASTRAR',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, color: Colors.white))),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color.fromRGBO(51, 111, 93, 1)),
                    ),
                  ]))),
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
    );
  }
}
