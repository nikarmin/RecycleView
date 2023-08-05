import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/views/bemvindo_page.dart';

import '../services/auth_service.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  bool loading = false;

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BemVindoPage();
      }));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Color.fromRGBO(245, 245, 245, 1),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/login.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(
              height: 200,
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
                  Text('Registrar com Facebook',
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
                  Text('Registrar com Google',
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
                  'Nome: ',
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
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Digite seu nome...',
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
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
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
                  'Cidade: ',
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Digite sua cidade...',
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
                    child: TextFormField(
                      obscureText: true,
                      controller: senha,
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  registrar();
                }
              },
              child: Text('REGISTRAR',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 14, color: Colors.white))),
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(left: 35, top: 15, bottom: 15, right: 35),
                  backgroundColor: Color.fromRGBO(51, 111, 93, 1)),
            ),
            // FutureBuilder(
            //     future: Authentication.initializeFirebase(context: context),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) {
            //         return Text('Error initializing Firebase');
            //       } else if (snapshot.connectionState == ConnectionState.done) {
            //         return GoogleSignInButton();
            //       }
            //       return CircularProgressIndicator(
            //         valueColor: AlwaysStoppedAnimation<Color>(
            //           Colors.green,
            //         ),
            //       );
            //     },
            //   ),
          ]),
        ));
  }
}
