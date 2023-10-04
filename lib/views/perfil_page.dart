import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/services/auth_service.dart';
import 'package:recycle_view/views/cadastro_pontos.dart';
import 'package:recycle_view/views/tela_inicial.dart';

import '../services/store_data.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

class _PerfilState extends State<Perfil> {
  int countPlastico = 0;
  int countMetal = 0;
  int countPapel = 0;
  int countVidro = 0;

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Adicionar reciclagem',
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.black)),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
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
                        backgroundColor: const Color.fromRGBO(134, 167, 102, 1),
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
            ],
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Enviar'),
        ),
      ],
    );
  }

  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  List<String> arquivos = [];
  List<Reference> refs = [];
  bool loading = true;
  final User? user = FirebaseAuth.instance.currentUser;

  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  late Image photo;

  Future<XFile?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  var img = null;

  loadImages() async {
    refs = (await storage.ref('images').listAll()).items;
    for (var ref in refs) {
      arquivos.add(await ref.getDownloadURL());
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadImages();
    img = user!.photoURL;
    getMateriais();
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);

    try {
      String ref = 'images/img-${DateTime.now().millisecondsSinceEpoch}.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          final String downloadUrl = await snapshot.ref.getDownloadURL();
          // print(user?.uid.toString());
          user?.updatePhotoURL(downloadUrl);
          img = user?.photoURL;
          await FirebaseFirestore.instance
              .collection("usuarios")
              .doc(user?.uid)
              .update({"urlFoto": downloadUrl});
          setState(() {
            uploading = false;
          });
        }
      });
    }
  }

  Uint8List? _bytesImage;

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text("Escolha uma opção:"),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(51, 111, 93, 1))),
                    onPressed: () async {
                      Navigator.pop(context);
                      pickAndUploadImage();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Galeria'),
                      ],
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(51, 111, 93, 1))),
                    onPressed: () async {
                      Navigator.pop(context);
                      pickAndUploadImage();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Câmera'),
                      ],
                    ))
              ]),
            ),
          );
        });
  }

  saveProfile() async {
    await StoreData().saveData(file: _bytesImage!);
  }

  getMateriais() async {
    final materiais = await FirebaseFirestore.instance
        .collection("usuarios")
        .where('email', isEqualTo: user?.email)
        .get();

    if (materiais.docs.isNotEmpty) {
      setState(() {
        countMetal = materiais.docs[0]['qtdMetal'];
        countPapel = materiais.docs[0]['qtdPapel'];
        countPlastico = materiais.docs[0]['qtdPlastico'];
        countVidro = materiais.docs[0]['qtdVidro'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int touchedIndex = -1;

    List<PieChartSectionData> showingSections() {
      return List.generate(4, (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        double radius = 130;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color.fromRGBO(99, 195, 111, 1),
              value: countVidro.toDouble(),
              title: 'Vidro',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: const Color.fromRGBO(242, 101, 101, 1),
              value: countPlastico.toDouble(),
              title: 'Plástico',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: const Color.fromRGBO(64, 140, 255, 1),
              value: countPapel.toDouble(),
              title: 'Papel',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
              ),
            );
          case 3:
            return PieChartSectionData(
              color: const Color.fromRGBO(254, 218, 74, 1),
              value: countMetal.toDouble(),
              title: 'Metal',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
              ),
            );
          default:
            throw Error();
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const ImageIcon(
              AssetImage('assets/images/icons/earth-day.png'),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(233, 233, 233, 1),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  img == null
                      ? Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  //shape: BoxShape.rectangle,
                                  shape: BoxShape.circle,
                                  //borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 207, 207, 207)),
                              height: 130,
                              width: 130,
                              child: Icon(
                                Icons.recycling_rounded,
                                size: 80,
                                color: Colors.green[900],
                              ),
                            ),
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => const Color.fromARGB(
                                                  255, 226, 226, 226)),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.zero),
                                      alignment: Alignment.center,
                                      shape: MaterialStateProperty.all<
                                          CircleBorder>(const CircleBorder())),
                                  onPressed: () {
                                    myAlert();
                                  },
                                  child: const Icon(
                                    Icons.brush,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipOval(
                                child: Image.network(
                              /*arquivos.last*/ user!.photoURL.toString(),
                              height: 130,
                              width: 130,
                              fit: BoxFit.fill,
                            )),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => const Color.fromARGB(
                                                255, 226, 226, 226)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.zero),
                                    alignment: Alignment.center,
                                    shape:
                                        MaterialStateProperty.all<CircleBorder>(
                                            const CircleBorder())),
                                onPressed: () {
                                  myAlert();
                                },
                                child: const Icon(
                                  Icons.brush,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user!.displayName.toString(),
                    style: GoogleFonts.archivo(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(user!.email.toString(),
                      style: GoogleFonts.archivo(fontSize: 14)),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromRGBO(51, 111, 93, 1))),
                        label: Text(
                          "Editar",
                          style: GoogleFonts.archivo(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        icon: const Icon(Icons.edit_rounded),
                        onPressed: () {
                          context.read<AuthService>().logout();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TelaInicial()));
                        },
                        //user!.displayName.toString()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromRGBO(51, 111, 93, 1))),
                        label: Text(
                          "Sair    ",
                          style: GoogleFonts.archivo(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        icon: const Icon(Icons.logout),
                        onPressed: () {
                          context.read<AuthService>().logout();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TelaInicial()));
                        },
                        //user!.displayName.toString()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromRGBO(51, 111, 93, 1))),
                        label: Text(
                          "Adicionar contribuição",
                          style: GoogleFonts.archivo(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        icon: const Icon(Icons.recycling_rounded),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const CadastroPontos();
                          }));
                        },
                        //user!.displayName.toString()
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(
                                      // touchCallback:
                                      //     (FlTouchEvent event, pieTouchResponse) {
                                      //   setState(() {
                                      //     if (!event
                                      //             .isInterestedForInteractions ||
                                      //         pieTouchResponse == false ||
                                      //         pieTouchResponse?.touchedSection ==
                                      //             null) {
                                      //       touchedIndex = -1;
                                      //       return;
                                      //     }
                                      //     touchedIndex = pieTouchResponse!
                                      //         .touchedSection!
                                      //         .touchedSectionIndex;
                                      //   });
                                      // },
                                      ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 0,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(233, 233, 233, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(23, 0, 0, 0),
                                    spreadRadius: 5,
                                    blurRadius: 12)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromRGBO(242, 101, 101, 1)),
                                    child: Image.asset(
                                      'assets/images/icons/bottle.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plástico',
                                    style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '$countPlastico itens',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(81, 79, 79, 1),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(233, 233, 233, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(23, 0, 0, 0),
                                    spreadRadius: 5,
                                    blurRadius: 12)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(99, 195, 111, 1)),
                                    child: Image.asset(
                                      'assets/images/icons/vidro.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vidro',
                                    style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '$countVidro itens',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(81, 79, 79, 1),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(233, 233, 233, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(23, 0, 0, 0),
                                    spreadRadius: 5,
                                    blurRadius: 12)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(254, 218, 74, 1)),
                                    child: Image.asset(
                                      'assets/images/icons/scrap.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Metal',
                                    style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '$countMetal itens',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(81, 79, 79, 1),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(233, 233, 233, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(23, 0, 0, 0),
                                    spreadRadius: 5,
                                    blurRadius: 12)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(64, 140, 255, 1)),
                                    child: Image.asset(
                                      'assets/images/icons/toilet-paper.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Papel',
                                    style: GoogleFonts.jost(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '$countPapel itens',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(81, 79, 79, 1),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
            ],
          ),
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
          ),
        ));
  }
}
