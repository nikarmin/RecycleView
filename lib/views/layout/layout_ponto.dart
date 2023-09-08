import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutPontos extends StatelessWidget {
  const LayoutPontos({super.key, required this.nome});

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(233, 233, 233, 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Text(
            nome,
            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20)),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: SizedBox(
              width: 30,
              height: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 226, 226, 226)),
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
                onPressed: () {},
                child: Container(
                    child: Text(
                  "?",
                  style: GoogleFonts.archivo(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )),
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 40,
            child: SizedBox(
              width: 30,
              height: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 226, 226, 226)),
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
                onPressed: () {},
                child: Container(
                    child: Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.black,
                  weight: 0.5,
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
