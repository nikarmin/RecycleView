import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/databases/db_firestore.dart';
import 'package:recycle_view/models/result_cep.dart';
import 'package:recycle_view/services/via_cep_service.dart';
import 'package:recycle_view/views/bemvindo_page.dart';
import 'package:recycle_view/views/login.dart';
import 'package:http/http.dart' as http;

import '../models/usuario.dart';
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
  final nome = TextEditingController();
  var _procurarCepController = TextEditingController();

  late FirebaseFirestore db;
  late AuthService auth;

  bool isLogin = true;
  bool loading = false;

  registrar(Usuario user) async {
    try {
      await context
          .read<AuthService>()
          .registrar(email.text, senha.text, nome.text, user);

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

  startFirestore() async {
    db = DBFirestore.get();
  }

  // registrar2(Usuario usuario) async {
  //   try {
  //     await context.read<AuthService>().registrar2(usuario);

  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return BemVindoPage();
  //     }));
  //   } on AuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(e.message!),
  //       backgroundColor: Colors.red,
  //     ));
  //   }
  // }

  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  late bool mostrar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostrar = false;
  }

  void _toggleObscured() {
    setState(() {
      mostrar = !mostrar;
    });
  }

  Future _encontrarCep() async {
    try {
      final String cep = _procurarCepController.text;
      final resultCep = await ViaCepService.fetchCep(cep: cep);
      print(resultCep.localidade);
    } on Exception catch (e) {
      Exception('Erro ao buscar CEP: $e');
    }
    // setState(() {
    //   _procurarCepController.text = resultCep.cep!;
    // });
  }

  // Future adicionarCep() async {
  //   try {
  //     user.cep = int.parse(_procurarCepController.text);
  //     final uid = await Provider.of(context).auth.getCurrentUID();
  //     await Provider.of(context)
  //         .db
  //         .collection('usuários')
  //         .document(uid)
  //         .setData(user.toJson());
  //   } on FirebaseException catch (e) {
  //     Exception('Erro ao buscar CEP: $e');
  //   }
  // }

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
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
                    Text('Registrar com Facebook',
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white)))
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 25, right: 25),
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
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 25, right: 25),
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
                        controller: nome,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Digite um nome válido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Digite seu primeiro nome...',
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
                      color: Colors.transparent,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          //|| !value.contains('@')
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                            return 'Digite um email válido';
                          }
                          return null;
                        },
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
                    'CEP: ',
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
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // inputFormatters: [
                        //   MaskTextInputFormatter(
                        //     mask: '#####-###',
                        //     type: MaskAutoCompletionType.lazy,
                        //     filter: {
                        //       "#": RegExp(
                        //           r'[0-9]'), //https://stackoverflow.com/questions/49644892/flutter-textinputformatter-regex-for-credit-card-expiry-date
                        //     },
                        //   )
                        // ],
                        validator: (value) {
                          if (value!.isEmpty || value.length != 8) {
                            return 'Digite um CEP válido';
                          } else {
                            _encontrarCep();
                          }
                        },
                        controller: _procurarCepController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: '00000-000...',
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
                      color: Colors.transparent,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Digite uma senha válida';
                          }
                          return null;
                        },
                        obscureText: !mostrar,
                        controller: senha,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(4),
                            child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                mostrar
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          ),
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final usuario = Usuario(
                        nome: nome.text,
                        email: email.text,
                        senha: senha.text,
                        cep: int.parse(_procurarCepController.text));

                    // registrar2(usuario);
                    // startFirestore();
                    registrar(usuario);
                    _encontrarCep();

                    // user.cep = int.parse(_procurarCepController.text);
                    // final uid = await Provider.of(context).auth.getCurrentUID();

                    // await Provider.of<dynamic>(context, listen: false)
                    //     .db
                    //     .collection('usuários')
                    //     .document(uid)
                    //     .setData(user.toJson());
                    // adicionarCep();
                  }
                },
                child: Text('REGISTRAR',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 14, color: Colors.white))),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 35, top: 15, bottom: 15, right: 35),
                    backgroundColor: Color.fromRGBO(51, 111, 93, 1)),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text.rich(TextSpan(
                    text: 'Já é ',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            color: Color.fromRGBO(51, 111, 93, 0.5),
                            fontWeight: FontWeight.w300)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'cadastrado?',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  color: Color.fromRGBO(51, 111, 93, 0.5),
                                  fontWeight: FontWeight.w600)))
                    ])),
              ),
              SizedBox(
                height: 15,
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
          ),
        ));
  }
}
