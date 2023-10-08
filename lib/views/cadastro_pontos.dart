import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/views/perfil_page.dart';

import '../models/coleta.dart';
import '../services/auth_service.dart';

class CadastroPontos extends StatefulWidget {
  const CadastroPontos({super.key});

  @override
  State<CadastroPontos> createState() => _CadastroPontosState();
}

class _CadastroPontosState extends State<CadastroPontos> {
  int countPlastico = 0;
  int countMetal = 0;
  int countPapel = 0;
  int countVidro = 0;

  cadastrarPonto(
      int countMetal, int countPapel, int countVidro, int countPlastico) async {
    await context.read<AuthService>().adicionarMaterialReciclado(
        countMetal, countPlastico, countPapel, countVidro);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
      appBar: AppBar(
        title: const ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/icons/account.png'),
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: Text(
                      'A partir da reciclagem podemos tornar o mundo um lugar melhor. Através do cadastro da quantidade de resíduos reciclados por você, você pode os conferir e comparar com o decorrer do tempo olhando os gráficos!',
                      style: GoogleFonts.jost(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 22)))),
              const SizedBox(
                height: 10,
              ),

              Container(
                width: 380,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(134, 167, 102, 1),
                ),
                child: Text('Cadastre de resíduos reciclados',
                    style: GoogleFonts.jost(
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 25))),
              ),
              const SizedBox(
                height: 10,
              ),

              // metal //////////////////////////////////////////////////////////////////////////
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.amber,
                ),
                width: 380,
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(134, 167, 102, 1),
                            onPressed: () {
                              setState(() {
                                if (countMetal > 0) {
                                  countMetal--;
                                } else {
                                  countMetal = 0;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          (countMetal >= 0 ? countMetal.toString() : '0'),
                          style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 35))),
                    ),
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                          backgroundColor:
                              const Color.fromRGBO(134, 167, 102, 1),
                          onPressed: () {
                            setState(() {
                              countMetal++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        )),
                    Text(' Metal',
                        style: GoogleFonts.jost(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 35)))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // plastico
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.red,
                ),
                width: 380,
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(134, 167, 102, 1),
                            onPressed: () {
                              setState(() {
                                if (countPlastico > 0) {
                                  countPlastico--;
                                } else {
                                  countPlastico = 0;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          (countPlastico >= 0 ? countPlastico.toString() : '0'),
                          style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 35))),
                    ),
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                          backgroundColor:
                              const Color.fromRGBO(134, 167, 102, 1),
                          onPressed: () {
                            setState(() {
                              countPlastico++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        )),
                    Text(' Plástico',
                        style: GoogleFonts.jost(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 35)))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // papel
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.lightBlueAccent,
                ),
                width: 380,
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(134, 167, 102, 1),
                            onPressed: () {
                              setState(() {
                                if (countPapel > 0) {
                                  countPapel--;
                                } else {
                                  countPapel = 0;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          (countPapel >= 0 ? countPapel.toString() : '0'),
                          style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 35))),
                    ),
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                          backgroundColor:
                              const Color.fromRGBO(134, 167, 102, 1),
                          onPressed: () {
                            setState(() {
                              countPapel++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        )),
                    Text(' Papel',
                        style: GoogleFonts.jost(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 35)))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // vidro
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 24, 87, 28),
                ),
                width: 380,
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(134, 167, 102, 1),
                            onPressed: () {
                              setState(() {
                                if (countVidro > 0) {
                                  countVidro--;
                                } else {
                                  countVidro = 0;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          (countVidro >= 0 ? countVidro.toString() : '0'),
                          style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 35))),
                    ),
                    SizedBox(
                        height: 25,
                        child: FloatingActionButton(
                          backgroundColor:
                              const Color.fromRGBO(134, 167, 102, 1),
                          onPressed: () {
                            setState(() {
                              countVidro++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        )),
                    Text(' Vidro',
                        style: GoogleFonts.jost(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 35)))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: const Alignment(0.85, 0.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(134, 167, 102, 1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  shadowColor: const Color.fromARGB(255, 85, 116, 54)),
              onPressed: () {
                cadastrarPonto(
                    countMetal, countPapel, countVidro, countPlastico);
              },
              child: SizedBox(
                height: 50,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text("Enviar",
                          style: GoogleFonts.jost(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 25))),
                      const SizedBox(width: 10),
                      const Icon(Icons.send)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
