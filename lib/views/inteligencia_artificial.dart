import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'anexo.dart';
import 'perfil_page.dart';
import 'preview_page.dart';

class InteligenciaArtificial extends StatefulWidget {
  const InteligenciaArtificial({super.key});

  @override
  State<InteligenciaArtificial> createState() => _InteligenciaArtificialState();
}

class _InteligenciaArtificialState extends State<InteligenciaArtificial> {
  File? arquivo;

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      setState(() {
        arquivo = file;
      });
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(233, 233, 233, 1),
        appBar: AppBar(
          title: ImageIcon(AssetImage('assets/images/icons/earth-love.png'),
              color: Colors.black),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/icons/profile.png'),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Perfil();
                }));
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              if(arquivo != null) Anexo(arquivo: arquivo!),
              ElevatedButton(
                  onPressed: () {
                    Get.to(CameraCamera(onFile: (file) => showPreview(file)));
                  },
                  child: Text('tirar foto')),
            ],
          ),
        )
        // body: Container(
        //   child: Center(child: _arquivoWidget()),
        // ),
        // floatingActionButton: imagem != null
        //     ? FloatingActionButton.extended(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         label: Text('Finalizar'))
        //     : null,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
        );
  }

  // _arquivoWidget() {
  //   return Container(
  //     width: size!.width - 50,
  //     height: size!.height - (size!.height / 3),
  //     child: imagem == null
  //         ? _cameraPreviewWidget()
  //         : Image.file(
  //             File(imagem!.path),
  //             fit: BoxFit.contain,
  //           ),
  //   );
  // }

  // _cameraPreviewWidget() {
  //   final CameraController? cameraController = controller;

  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     return const Text('Widget para Câmera que não está disponível');
  //   } else {
  //     return Stack(
  //       alignment: Alignment.bottomCenter,
  //       children: [CameraPreview(controller!), _botaoCapturaWidget()],
  //     );
  //   }
  // }

  // _botaoCapturaWidget() {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 10),
  //     child: CircleAvatar(
  //       radius: 32,
  //       backgroundColor: Colors.black,
  //       child: IconButton(
  //         icon: Icon(
  //           Icons.camera_alt,
  //           color: Colors.white,
  //           size: 30,
  //         ),
  //         onPressed: tirarFoto(),
  //       ),
  //     ),
  //   );
  // }

  // tirarFoto() async {
  //   final CameraController? cameraController = controller;

  //   if (cameraController != null && cameraController.value.isInitialized) {
  //     try {
  //       XFile file = await cameraController.takePicture();
  //       if (mounted)
  //         setState(() {
  //           imagem = file;
  //         });
  //     } on CameraException catch (e) {
  //       print(e.description);
  //     }
  //   }
  // }
}
