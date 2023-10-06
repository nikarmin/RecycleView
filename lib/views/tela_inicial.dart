import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recycle_view/views/cadastro.dart';
import 'package:recycle_view/views/login.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(233, 233, 233, 1),
          image: DecorationImage(
              image: AssetImage('assets/images/wave.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter)),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: Image.asset(
                'assets/images/sparkles.png',
              ),
            ),
            const SizedBox(
              height: 58,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'RecycleView ',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 34, fontWeight: FontWeight.w300)),
              ),
              Image.asset(
                'assets/images/ecology.png',
                height: 50,
                width: 50,
              ),
            ]),
            //Text('RecycleView', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 34, fontWeight: FontWeight.w300)),),
            Text('O jeito reciclável de ser!',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 14))),
            //Image.asset('assets/images/planet-earth.png',),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 25, right: 25),
                  backgroundColor: const Color.fromRGBO(156, 204, 140, 1)),
              child: Text('Entrar',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w300))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cadastro()));
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 25, right: 25),
                  backgroundColor: const Color.fromRGBO(156, 204, 140, 1)),
              child: Text('Cadastrar',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w300))),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ));
  }
}
