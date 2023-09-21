import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EsqueceuSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/login.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 210,
            ),

            Text("Esqueceu sua senha?", 
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                fontSize: 35,
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500
                ),
              )
            ),

            Text("No email cadastrado será enviado um código para a troca de senha",
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500
                  ),
              )
            ),

            SizedBox(
              height: 20,
            ),
              

            Padding(
                padding: EdgeInsets.only(left: 57),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Email: ',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.jost(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: 310,
                    child: Material(
                      // TIRAR O FOCUS DO TEXTFIELD!!
                      color: Colors.transparent,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        // controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Digite um email válido!';
                          }
                          return null;
                        },
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
                height: 20,
              ),
              
              Center(
                child: ElevatedButton(
                  child: Container(
                    height: 50,
                    width: 170,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 45
                          ),

                          Text("Enviar", 
                            style: GoogleFonts.jost(
                              textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25
                          ))),

                          SizedBox(
                            width: 10
                          ),

                          Icon(Icons.send),

                          SizedBox(
                            width: 10
                          ),
                        ],
                      ),
                    ),  
                 ),
               
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(51, 111, 93, 1,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    shadowColor: Color.fromRGBO(35, 81, 67, 1)
                ),

                
                  
                onPressed: () {
                  
                },
              ),
                
            ),  
        ])
    );
  }
}
