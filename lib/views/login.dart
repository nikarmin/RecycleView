import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/views/cadastro.dart';
import 'package:recycle_view/views/esqueceu_a_senha_page.dart';
import 'package:recycle_view/views/home_screen.dart';

import '../services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  bool loading = false;

  String alertText = '';

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (!isLogin) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Cadastro()));
      }
    });
  }

  login() async {
    //   try {
    setState(() {
      loading = true;
    });

    var msg = await context.read<AuthService>().login(email.text, senha.text);

    if (msg == 'null') {
      setState(() {
        loading = false;
        alertText = 'O usuário não existe!';
      });

      email.clear();
      senha.clear();
    } else if (msg == 'user-not-found') {
      setState(() {
        loading = false;
        alertText = 'O usuário não existe!';
      });

      email.clear();
      senha.clear();
    } else if (msg == 'wrong-password') {
      setState(() {
        loading = false;
        alertText = 'O usuário não existe!';
      });

      email.clear();
      senha.clear();
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    }
  }

  final textFieldFocusNode = FocusNode();
  late bool mostrar;

  @override
  initState() {
    super.initState();
    setFormAction(true);
    mostrar = false;
  }

  void _toggleObscured() {
    setState(() {
      mostrar = !mostrar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/teste.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(children: [
                const SizedBox(
                  height: 280,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 25, right: 25),
                      backgroundColor: const Color.fromRGBO(24, 119, 242, 1)),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Logar com Facebook',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.white)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 30, right: 30),
                      backgroundColor: const Color.fromRGBO(24, 119, 242, 1)),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Logar com Google',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.white)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                
    
                
                Row(
                children: [
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 57),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text('Email: ', textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                decoration: TextDecoration.none, fontSize: 18,
                                color: Colors.black, fontWeight: FontWeight.w300)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: SizedBox(width: 275,
                            child: Material(
                              color: Colors.transparent,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Digite um email válido!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: 'Digite seu email...',
                                  hintStyle: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.3)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(51, 111, 93, 0.47), width: 1.5)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(51, 111, 93, 0.47), width: 1.5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
    
                const SizedBox(height: 25),
    
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 57),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text('Senha: ', textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  decoration: TextDecoration.none, fontSize: 18,
                                  color: Colors.black, fontWeight: FontWeight.w300)),
                            ),
                          ),
                        ),
                          
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: SizedBox(width: 275,
                              child: Material(
                                color: Colors.transparent,
                                child: TextFormField(
                                  obscureText: !mostrar, 
                                  controller: senha,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Digite uma senha válida!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(4),
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
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText: 'Digite sua senha...',
                                    hintStyle: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(51, 111, 93, 0.47),
                                            width: 1.5)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(51, 111, 93, 0.47),
                                            width: 1.5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]
                ),
                
                const SizedBox(
                  height: 25,
                ),
                alertText != ''
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                alertText,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : Container(),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: (loading)
                        ? [
                            const Padding(padding: EdgeInsets.all(16)),
                            const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                  color: Color.fromRGBO(51, 111, 93, 1)),
                            )
                          ]
                        : [
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  login();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 35, top: 15, bottom: 15, right: 35),
                                  backgroundColor:
                                      const Color.fromRGBO(51, 111, 93, 1)),
                              child: Text('ENTRAR',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14, color: Colors.white))),
                            ),
                          ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EsqueceuSenha()));
                  },
                  child: Text.rich(TextSpan(
                      text: 'Esqueceu sua ',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              color: Color.fromRGBO(51, 111, 93, 0.5),
                              fontWeight: FontWeight.w300)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'senha?',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    color: Color.fromRGBO(51, 111, 93, 0.5),
                                    fontWeight: FontWeight.w600)))
                      ])),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cadastro()));
                  },
                  child: Text.rich(TextSpan(
                      text: 'Não possui uma ',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              color: Color.fromRGBO(51, 111, 93, 0.5),
                              fontWeight: FontWeight.w300)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'conta?',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    color: Color.fromRGBO(51, 111, 93, 0.5),
                                    fontWeight: FontWeight.w600)))
                      ])),
                ),
                const SizedBox(height: 25)
              ]),
            ),
          )),
    );
  }
}
