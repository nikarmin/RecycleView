import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class LayoutPontos extends StatefulWidget {
  const LayoutPontos(
      {super.key,
      required this.nome,
      required this.lat,
      required this.long,
      /* required this.pontos,
*/
      required this.tipo,
      required this.horario,
      required this.cidade});

  final String nome;
  final double lat;
  final double long;
  final String horario;
  final String tipo;
  final String cidade;
  //final List<LatLng> pontos;

  @override
  State<LayoutPontos> createState() => _LayoutPontosState();
}

class _LayoutPontosState extends State<LayoutPontos> {
  // setPoints() {
  //   LatLng loc = LatLng(widget.lat, widget.long);
  //   widget.pontos.add(loc);
  // }

  // getPoints() {
  //   return widget.pontos;
  // }

  // @override
  // void initState() {
  //   setPoints();
  //   super.initState();
  // }

  // LatLng loc;

  // LatLng get localizacao {
  //   loc = LatLng(lat, long);
  //   return loc;
  // }

  // final String tipo;
  // final String horario;

  popUpTipo(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromRGBO(233, 233, 233, 1)),
        height: 80,
        child: Expanded(
          child: Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                size: 30,
                color: Colors.black,
              ),
              Text(
                widget.tipo,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  popUpHorario(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromRGBO(233, 233, 233, 1)),
        height: 80,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.access_time_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.horario,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Dialog(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //   child: Container(
    //     color: const Color.fromRGBO(233, 233, 233, 1),
    //     height: MediaQuery.of(context).size.height,
    //     child: Text(
    //       widget.horario,
    //       style: const TextStyle(fontSize: 20),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(233, 233, 233, 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Text(
            widget.nome,
            style:
                GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 20)),
          ),
          Positioned(
            bottom: 2,
            child: Row(
              children: [
                const Icon(
                  Icons.location_city_rounded,
                  color: Colors.black,
                ),
                Text(widget.cidade,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15))),
              ],
            ),
          ),
          /*Positioned(
            bottom: 2,
            right: 2,
            child: SizedBox(
              width: 30,
              height: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 226, 226, 226)),
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder())),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => popUpTipo(context));
                },
                child: Text(
                  "?",
                  style: GoogleFonts.archivo(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),*/
          Positioned(
            bottom: 2,
            right: 2,
            child: SizedBox(
              width: 30,
              height: 30,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 226, 226, 226)),
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder())),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => popUpHorario(context));
                },
                child: const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.black,
                  weight: 0.5,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
