import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroDePontosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 1),
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background/cadastro_de_pontos_page.png'),
              fit: BoxFit.fill,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Nome do ponto:',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0, top: 20.0),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: 280,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Digite o nome do ponto...',
                                hintStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        width: 1.5)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        width: 1.5))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'CEP:',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0, top: 20.0),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: 280,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Digite o número do CEP...',
                                hintStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        width: 1.5)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        width: 1.5))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Número do ponto:',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, top: 20, bottom: 20),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: 280,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Digite o número do ponto...',
                                hintStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        width: 1.5)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        width: 1.5))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('O que esse ponto recolhe?',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Theme(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text('Óleo',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)))
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text('Eletrônicos',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)))
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text('Recicláveis',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)))
                              ],
                            )
                          ],
                        ),
                        data: ThemeData(
                            unselectedWidgetColor:
                                Color.fromRGBO(51, 111, 93, 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('CADASTRAR PONTO',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            backgroundColor: Color.fromRGBO(51, 111, 93, 1)),
                      ),
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
