import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/services/auth_service.dart';
import 'package:recycle_view/views/tela_inicial.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                  Text(
                    'Objeto:',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Óleo',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)))
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Eletrônicos',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)))
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Recicláveis',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)))
                    ],
                  )
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
  final user = FirebaseAuth.instance.currentUser;

  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  late Image photo;

  Future getImage(ImageSource media) async {
    var img = await _picker.pickImage(source: media);

    setState(() {
      _image = img;
      //photo = Image.file(File(user!.photoURL.toString()));
    });
    await context.read<AuthService>().updateFoto(_image!.path);
  }

  @override
  void initState() {
    super.initState();
    photo = Image.file(File(user!.photoURL.toString()));
  }

  Future<void> upload(String path) async {
    File file = File(path);

    try {
      String ref = 'images/img-${DateTime.now().millisecondsSinceEpoch}.jpg';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

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
                      getImage(ImageSource.gallery);
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
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                      context.read<AuthService>().updateFoto(_image!.path);
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

  @override
  Widget build(BuildContext context) {
    List<_PieData> data = [
      _PieData('35', 45, 'Jan'),
      _PieData('28', 23, 'Feb'),
    ];

    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    Uint8List _bytesImage;

    pegarImg(String url) {
      return _bytesImage = Base64Decoder().convert(url);
    }

    return Scaffold(
        appBar: AppBar(
          title: ImageIcon(AssetImage('assets/images/icons/earth-love.png'),
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
                AssetImage('assets/images/icons/profile.png'),
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
                  user?.photoURL != null
                      ? Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipOval(
                                child: Image.memory(
                              pegarImg(user!.photoURL.toString()),
                              height: 130,
                              width: 130,
                            )),
                            //File(user!.photoURL.toString()),
                            // File(stringToBase64Url
                            //     .decode(user!.photoURL.toString())),
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
                        ])
                      : Stack(
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
                        ),
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
                      child: SingleChildScrollView(
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
                          ])))
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

// return Scaffold(
//       body: ElevatedButton(
//         onPressed: () {
//           context.read<AuthService>().logout();
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => TelaInicial()));
//         },
//         //user!.displayName.toString()
//         child: Text("Sair..."),
//       ),
//     );
//   }