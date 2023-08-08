import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/services/auth_service.dart';
import 'package:recycle_view/views/tela_inicial.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final user = FirebaseAuth.instance.currentUser;

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await _picker.pickImage(source: media);

    setState(() {
      _image = img;
    });
  }

  Future<void> upload(String path) async {
    File file = File(path);

    try {
      String ref  = 'images/img-${DateTime.now().millisecondsSinceEpoch}.jpg';
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
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('Galeria'),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(233, 233, 233, 1),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    myAlert();
                    context.read<AuthService>().updateFoto(_image!.path);
                  },
                  child: Text('Escolher foto'),
                ),
                SizedBox(
                  height: 10,
                ),
                //if image not null show the image
                //if image null show text
                _image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(_image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                      )
                    : Text(
                        "Sem imagem...",
                        style: TextStyle(fontSize: 20),
                      ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthService>().logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TelaInicial()));
                  },
                  //user!.displayName.toString()
                  child: Text("Sair..."),
                ),
              ],
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
              child: BottomNavigationBar(
                currentIndex: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Color.fromARGB(255, 89, 165, 128),
                onTap: (value) {},
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icons/home.png',
                      ),
                      size: 50,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/camera.png'),
                        size: 50,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/newspaper.png'),
                        size: 50,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/pin.png'),
                        size: 50,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/planet-ecologic.png'),
                        size: 50,
                      ),
                      label: ''),
                ],
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