import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/teste.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/face-icon.png',
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Logar com Facebook',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.white)))
              ],
            ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                backgroundColor: Color.fromRGBO(24, 119, 242, 1)),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/google-icon.png',
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Logar com Google',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.white)))
              ],
            ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                backgroundColor: Color.fromRGBO(24, 119, 242, 1)),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 57),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Email: ',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: SizedBox(
                width: 250,
                child: Material(
                  // TIRAR O FOCUS DO TEXTFIELD!!
                  color: Colors.transparent,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Digite seu email...',
                      hintStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(51, 111, 93, 0.47),
                              width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(51, 111, 93, 0.47),
                              width: 1.5)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 57),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Senha: ',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: SizedBox(
                width: 250,
                child: Material(
                  // TIRAR O FOCUS DO TEXTFIELD!!
                  color: Colors.transparent,
                  child: TextField(
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Digite sua senha...',
                      hintStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(51, 111, 93, 0.47),
                              width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(51, 111, 93, 0.47),
                              width: 1.5)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('ENTRAR',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 14, color: Colors.white))),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 35, right: 35),
                backgroundColor: Color.fromRGBO(51, 111, 93, 1)),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Esqueceu sua senha?',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Color.fromRGBO(51, 111, 93, 0.5),
                      fontWeight: FontWeight.w300))),
        ]));
  }
}
  //   return Scaffold(
  //     body: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height,
  //         child: Container(
  //           decoration: const BoxDecoration(
  //             image: DecorationImage(
  //               image: AssetImage('assets/images/login.png'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
            
  //         )
  //       ),
  //     );
  // }