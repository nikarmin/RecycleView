import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrocarSenha extends StatefulWidget {
  const TrocarSenha({super.key});

  @override
  State<TrocarSenha> createState() => _TrocarSenhaState();
}

class _TrocarSenhaState extends State<TrocarSenha> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/login.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [
          const SizedBox(
            height: 210,
          ),

          Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      RichText(
                        text: TextSpan(
                            text: "Nova senha",
                            style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      RichText(
                        text: TextSpan(
                            text:
                                "Sua nova senha precisa ter no mínimo 6 caracteres.",
                            style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                    ],
                  )
                ],
              )),

          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: EdgeInsets.only(left: 57),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Nova senha: ',
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
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 300,
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
                    //obscureText: !mostrar,
                    //controller: senha,
                    decoration: InputDecoration(
                      /*
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
                        ),*/
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Digite sua nova senha...',
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
            height: 5,
          ),

          Padding(
            padding: EdgeInsets.only(left: 57),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Mínimo de 6 caracteres',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.3))))),
          ),

          SizedBox(
            height: 30,
          ),

////////////////////////////////////////////////////////////////////////////////////////////////////////

          Padding(
            padding: EdgeInsets.only(left: 57),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Confirme a nova senha: ',
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
                    //obscureText: !mostrar,
                    //controller: senha,
                    decoration: InputDecoration(
                      /*
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
                          ),*/
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Confirme sua nova senha...',
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
            height: 5,
          ),

          Padding(
            padding: EdgeInsets.only(left: 57),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Confira se as duas senhas são iguais!',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.3))))),
          ),

          const SizedBox(
            height: 30,
          ),
//////////////////////////////////////////////////////////////////////////////////////////////////////

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                    51,
                    111,
                    93,
                    1,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  shadowColor: const Color.fromRGBO(35, 81, 67, 1)),
              onPressed: () {},
              child: SizedBox(
                height: 50,
                width: 170,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(width: 45),
                      Text("Enviar",
                          style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 25))),
                      const SizedBox(width: 10),
                      const Icon(Icons.send),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
