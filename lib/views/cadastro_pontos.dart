import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  cadastrarPonto() async {
    await context.read<AuthService>().adicionarMaterialReciclado(
        countMetal, countPapel, countPlastico, countVidro);
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Cadastre seus resíduos!',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
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
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                    Text(
                      ' Metal',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
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
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                    Text(
                      ' Plástico',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
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
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                    Text(
                      ' Papel',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
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
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                    Text(
                      ' Papel',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                cadastrarPonto();
              },
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: const Color.fromRGBO(134, 167, 102, 1)),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
