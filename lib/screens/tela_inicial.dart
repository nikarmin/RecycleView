import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //padding: EdgeInsets.symmetric(vertical: 12),
        //alignment: Alignment.center,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: <Widget>[
                  Image.asset(
                    'assets/images/wave.png',
                     alignment: Alignment.topCenter,
                     fit: BoxFit.fill,
                  ),
                Container(
                  alignment: AlignmentDirectional.topEnd,
                  child: Image.asset(
                    'assets/images/sparkles.png',
                  ),
                )
              ]),
              SizedBox(
                height: 100,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'RecycleView ',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w300)),
                ),
                Image.asset(
                  'assets/images/planet-earth.png',
                  height: 40,
                  width: 40,
                ),
              ]),
              //Text('RecycleView', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 34, fontWeight: FontWeight.w300)),),
              Text('O jeito reciclável de ser!',
                  style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14))),
              //Image.asset('assets/images/planet-earth.png',),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Entrar',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300))),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 25, right: 25),
                    backgroundColor: Color.fromRGBO(156, 204, 140, 1)),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Cadastrar',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300))),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 25, right: 25),
                    backgroundColor: Color.fromRGBO(156, 204, 140, 1)),
              ),
              SizedBox(
                height: 290,
              ),
              Stack(children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset('assets/images/ellipse.png'),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset(
                    'assets/images/leave.png',
                    height: 190,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Image.asset(
                      'assets/images/recycle-bin.png',
                    ),
                  ),
                )
              ]),
              // criarStack()
            ],
          ),
        ));
  }
}
