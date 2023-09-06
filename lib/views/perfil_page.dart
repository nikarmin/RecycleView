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
import 'package:recycle_view/views/tela_inicial.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../services/store_data.dart';
import 'indicator.dart';

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
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Text(
        'Adicionar reciclagem',
        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black)),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(3)),
                            shape: MaterialStateProperty.all(CircleBorder()),
                          ),
                        ),
                      ),
                      Text('oiii'),
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            '+',
                            textAlign: TextAlign.center,
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(3)),
                            shape: MaterialStateProperty.all(CircleBorder()),
                          ),
                        ),
                      )
                    ],
                  )

                  // Text(
                  //   'Objeto:',
                  //   textAlign: TextAlign.left,
                  //   style: GoogleFonts.poppins(
                  //       textStyle: TextStyle(
                  //           decoration: TextDecoration.none,
                  //           fontSize: 16,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w300)),
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(value: false, onChanged: (value) {}),
                  //     Text('Óleo',
                  //         style: GoogleFonts.jost(
                  //             textStyle: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Colors.black)))
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(value: false, onChanged: (value) {}),
                  //     Text('Eletrônicos',
                  //         style: GoogleFonts.jost(
                  //             textStyle: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Colors.black)))
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(value: false, onChanged: (value) {}),
                  //     Text('Recicláveis',
                  //         style: GoogleFonts.jost(
                  //             textStyle: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Colors.black)))
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
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
          print(user?.uid.toString());
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
            title: Text("Escolha uma opção:"),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromRGBO(51, 111, 93, 1))),
                    onPressed: () async {
                      Navigator.pop(context);
                      pickAndUploadImage();
                    },
                    child: Row(
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
                            (states) => Color.fromRGBO(51, 111, 93, 1))),
                    onPressed: () async {
                      Navigator.pop(context);
                      pickAndUploadImage();
                    },
                    child: Row(
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
    String resp = await StoreData().saveData(file: _bytesImage!);
  }

  @override
  Widget build(BuildContext context) {
    List<_PieData> data = [
      _PieData('35', 45, 'Jan'),
      _PieData('28', 23, 'Feb'),
    ];

    int touchedIndex = -1;

    List<PieChartSectionData> showingSections() {
      return List.generate(4, (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Colors.green,
              value: 40,
              title: '40%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: Colors.red,
              value: 30,
              title: '30%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: Colors.blue,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: shadows,
              ),
            );
          case 3:
            return PieChartSectionData(
              color: Colors.purple,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
              color: Colors.black),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: ImageIcon(
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
            color: Color.fromRGBO(233, 233, 233, 1),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  img == null
                      ? Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
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
                                              (states) => Color.fromARGB(
                                                  255, 226, 226, 226)),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.zero),
                                      alignment: Alignment.center,
                                      shape: MaterialStateProperty.all<
                                          CircleBorder>(CircleBorder())),
                                  onPressed: () {
                                    myAlert();
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.brush,
                                      color: Colors.black,
                                      size: 15,
                                    ),
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
                                    backgroundColor: MaterialStateColor
                                        .resolveWith((states) =>
                                            Color.fromARGB(255, 226, 226, 226)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.zero),
                                    alignment: Alignment.center,
                                    shape:
                                        MaterialStateProperty.all<CircleBorder>(
                                            CircleBorder())),
                                onPressed: () {
                                  myAlert();
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.brush,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user!.displayName.toString(),
                    style: GoogleFonts.archivo(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(user!.email.toString(),
                      style: GoogleFonts.archivo(fontSize: 14)),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromRGBO(51, 111, 93, 1))),
                        label: Text(
                          "Editar",
                          style: GoogleFonts.archivo(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        icon: Icon(Icons.edit_rounded),
                        onPressed: () {
                          context.read<AuthService>().logout();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaInicial()));
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
                                (states) => Color.fromRGBO(51, 111, 93, 1))),
                        label: Text(
                          "Sair    ",
                          style: GoogleFonts.archivo(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        icon: Icon(Icons.logout),
                        onPressed: () {
                          context.read<AuthService>().logout();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaInicial()));
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
                                (states) => Color.fromRGBO(51, 111, 93, 1))),
                        label: Text(
                          "Adicionar contribuição",
                          style: GoogleFonts.archivo(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        icon: Icon(Icons.recycling_rounded),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context));
                        },
                        //user!.displayName.toString()
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      setState(() {
                                        if (!event
                                                .isInterestedForInteractions ||
                                            pieTouchResponse == false ||
                                            pieTouchResponse?.touchedSection ==
                                                null) {
                                          touchedIndex = -1;
                                          return;
                                        }
                                        touchedIndex = pieTouchResponse!
                                            .touchedSection!
                                            .touchedSectionIndex;
                                      });
                                    },
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Indicator(
                                color: Colors.black,
                                text: 'First',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.white,
                                text: 'Second',
                                isSquare: true,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ])
                      ],
                    ),
                    /*SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            SfCircularChart(
                                title:
                                    ChartTitle(text: 'Sales by sales person'),
                                legend: Legend(isVisible: true),
                                series: <PieSeries<_PieData, String>>[
                                  PieSeries<_PieData, String>(
                                      explode: true,
                                      explodeIndex: 0,
                                      dataSource: data,
                                      xValueMapper: (_PieData data, _) =>
                                          data.xData,
                                      yValueMapper: (_PieData data, _) =>
                                          data.yData,
                                      dataLabelMapper: (_PieData data, _) =>
                                          data.text,
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true)),
                                ])
                          ]))*/
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(233, 233, 233, 1),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
            ],
          ),
          child: ClipRRect(
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
