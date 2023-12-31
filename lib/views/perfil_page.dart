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
import 'package:recycle_view/views/cadastro_materiais.dart';
import 'package:recycle_view/views/tela_inicial.dart';

import '../services/store_data.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  int countPlastico = 0;
  int countMetal = 0;
  int countPapel = 0;
  int countVidro = 0;

  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  List<String> arquivos = [];
  List<Reference> refs = [];
  bool loading = true;
  User? user = FirebaseAuth.instance.currentUser;

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

  @override
  dispose() {
    super.dispose();
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

// SingleChildScrollView(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: 500,

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text("Editar perfil"),
            content: SizedBox(
              height: 460,
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Nova foto:',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        ),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(51, 111, 93, 1))),
                          onPressed: () async {
                            Navigator.pop(context);
                            setState(() {
                              pickAndUploadImage();
                            });
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
                                  (states) =>
                                      const Color.fromRGBO(51, 111, 93, 1))),
                          onPressed: () async {
                            Navigator.pop(context);
                            setState(() {
                              pickAndUploadImage();
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.camera),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Câmera'),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Novo nome:',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        ),
                      ),
                      TextField(
                        controller: controller_nome,
                        decoration: InputDecoration(
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: user?.displayName.toString(),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Novo email:',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        ),
                      ),
                      TextField(
                        controller: controller_email,
                        decoration: InputDecoration(
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: user?.email.toString(),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Nova senha:',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        ),
                      ),
                      TextField(
                        controller: controller_senha,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Escreva uma nova senha...',
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
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(51, 111, 93, 1),
                                shape: const CircleBorder(),
                                shadowColor:
                                    const Color.fromARGB(255, 85, 116, 54)),
                            onPressed: () async {
                              //editarPerfil();
                              if (controller_nome.text.isEmpty) {
                                controller_nome.text =
                                    user!.displayName.toString();
                              }
                              if (controller_email.text.isEmpty) {
                                controller_email.text = user!.email.toString();
                              }

                              await context.read<AuthService>().editar(
                                  controller_nome.text,
                                  controller_senha.text,
                                  controller_email.text);

                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.send,
                              size: 20,
                            )),
                      )
                    ]),
              ),
            ),
          );
        });
  }

  saveProfile() async {
    await StoreData().saveData(file: _bytesImage!);
  }

  late int contadorMetal = 0;
  late int contadorPapel;
  late int contadorPlastico;
  late int contadorVidro;

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

    // setState(() {
    //   getMateriais();
    // });
  }

  var controller_nome = TextEditingController();
  var controller_email = TextEditingController();
  var controller_senha = TextEditingController();

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
              color: const Color.fromARGB(255, 56, 139, 60),
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
              color: const Color.fromRGBO(244, 67, 54, 1),
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
              color: Colors.lightBlueAccent,
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
              color: Colors.amber,
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

                  // Row(
                  //   children: [
                  //     const SizedBox(width: 10),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 20.0),
                  //       child: Align(
                  //         alignment: Alignment.topLeft,
                  //         child: ElevatedButton.icon(
                  //           style: ButtonStyle(
                  //               backgroundColor: MaterialStateColor.resolveWith(
                  //                   (states) =>
                  //                       const Color.fromRGBO(51, 111, 93, 1))),
                  //           label: Text(
                  //             "Editar",
                  //             style: GoogleFonts.archivo(
                  //                 fontSize: 14, fontWeight: FontWeight.w500),
                  //           ),
                  //           icon: const Icon(Icons.edit_rounded),
                  //           onPressed: () {
                  //             editarPerfil();
                  //           },
                  //           //user!.displayName.toString()
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 150),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 20.0),
                  //       child: Align(
                  //         alignment: Alignment.topLeft,
                  //         child: ElevatedButton.icon(
                  //           style: ButtonStyle(
                  //               backgroundColor: MaterialStateColor.resolveWith(
                  //                   (states) =>
                  //                       const Color.fromRGBO(51, 111, 93, 1))),
                  //           label: Text(
                  //             "Sair    ",
                  //             style: GoogleFonts.archivo(
                  //                 fontSize: 14, fontWeight: FontWeight.w500),
                  //           ),
                  //           icon: const Icon(Icons.logout),
                  //           onPressed: () {
                  //             context.read<AuthService>().logout();
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         const TelaInicial()));
                  //           },
                  //           //user!.displayName.toString()
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  
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
                      )
                    ),

                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Gráfico de resíduos reciclados",
                      style: GoogleFonts.archivo(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// grafico
                  Stack(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.5,
                                child: PieChart(
                                  PieChartData(
                                      pieTouchData: PieTouchData(),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 0,
                                      sections: showingSections()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 95,
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        const Color.fromRGBO(51, 111, 93, 1)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero),
                                alignment: Alignment.center,
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    const CircleBorder())),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const CadastroMateriais();
                                }),
                              );
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// counts

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
                                        color: Colors.red),
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
                                        color:
                                            Color.fromARGB(255, 56, 139, 60)),
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
                                      color: Colors.amber,
                                    ),
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
                                      color: Colors.lightBlueAccent,
                                    ),
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// button

                  const SizedBox(height: 20),

                  /*
                  Row(
                    children: [
                      const SizedBox(width: 135),
                      Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(51, 111, 93, 1))), //const Color.fromRGBO(134, 167, 102, 1),
                          label: Text(
                            "Adicionar contribuição",
                            style: GoogleFonts.archivo(
                                fontSize: 22, fontWeight: FontWeight.w300),
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
                      )),

                    ],
                  )*/
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
