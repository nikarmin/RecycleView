import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
// import 'package:tflite/tflite.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

import 'anexo.dart';
import 'perfil_page.dart';
import 'preview_page.dart';

class InteligenciaArtificial extends StatefulWidget {
  const InteligenciaArtificial({super.key});

  @override
  State<InteligenciaArtificial> createState() => _InteligenciaArtificialState();
}

class _InteligenciaArtificialState extends State<InteligenciaArtificial> {
  // File? arquivo;

  // showPreview(file) async {
  //   file = await Get.to(() => PreviewPage(file: file));

  //   if (file != null) {
  //     setState(() {
  //       arquivo = file;
  //     });
  //     Get.back();
  //   }
  // }

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  CameraImage? _image;
  var interpreter;
  var inputTensor;
  var outputTensor;
  var labels;

  @override
  void initState() {
    // _loadModel();
    //_loadLabels();
    loadModel().then((value) {
      setState(() {});
    });
    loadCamera();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  bool flashOn = false;

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          controller!.startImageStream((image) {
            _image = image;
            runModel();
          });
        });
      });
    } else {
      print("NO any camera found");
    }
  }

  late File image2;
  bool setImage = false;
  List result = [];
  String output = '';

  Future<void> chooseFile() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image!.path != null) {
      setState(() {
        setImage = true;
        image2 = File(image.path);
      });
    }
    predictImage(image2);
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  // Load model
  // Future<void> _loadModel() async {
  //   final options = InterpreterOptions();
  //   // Load model from assets
  //   interpreter = await Interpreter.fromAsset('assets/model_unquant.tflite',
  //       options: options);
  //   // Get tensor input shape [1, 224, 224, 3]
  //   inputTensor = interpreter.getInputTensors().first;
  //   // Get tensor output shape [1, 1001]
  //   outputTensor = interpreter.getOutputTensors().first;
  // }

  runModel() async {
    if (_image != null) {
      var prediction = await Tflite.runModelOnFrame(
          bytesList: _image!.planes.map((e) {
            return e.bytes;
          }).toList(),
          imageHeight: _image!.height,
          imageWidth: _image!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);

      for (var elements in prediction!) {
        setState(() {
          output = elements['label'];
        });
        print(output);
      }
    }
  }

  predictImage(File img) async {
    var output = await Tflite.runModelOnImage(
        path: img.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      result = output!;
    });
    print(output);
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      appBar: AppBar(
        title: ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/icons/account.png'),
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
      body: /*ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: (controller!.value.isInitialized)
                  ? AspectRatio(
                      aspectRatio: controller!.value.aspectRatio,
                      child: CameraPreview(controller!),
                    )
                  : Container(),
            )
          ],
        ),*/
          /* Column(
          children: [
            (setImage) ? Image.file(image2) : Container(),
            (result.isEmpty) ? Container() : Text(result.toString()),
            InkWell(
              onTap: () {
                chooseFile();
              },
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
                child: Text("Escolheee aii"),
              ),
            ),
          ],
        )*/

          Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: controller == null
                ? Center(child: Text("Loading Camera..."))
                : !controller!.value.isInitialized
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!)
            // child: Column(
            //   children: [
            //     if (arquivo != null) Anexo(arquivo: arquivo!),
            //     ElevatedButton(
            //         onPressed: () {
            //           Get.to(CameraCamera(onFile: (file) => showPreview(file)));
            //         },
            //         child: Text('tirar foto')),
            //   ],
            ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    if (controller != null) {
                      //check if contrller is not null
                      if (controller!.value.isInitialized) {
                        //check if controller is initialized
                        image = await controller!.takePicture(); //capture image
                        setState(() {
                          File(image!.path);
                        });
                      }
                    }
                  } catch (e) {
                    print(e); //show error
                  }
                },
                child: Text(''),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(
                        side: BorderSide(color: Colors.white, width: 2)))),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0, right: 18.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                onPressed: () {
                  flashOn = true;
                  // if (flashOn == true)
                  //   controller?.setFlashMode(FlashMode.always);
                  // else {
                  //   flashOn = false;
                  //   controller?.setFlashMode(FlashMode.off);
                  // }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flash_on_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
                style: ButtonStyle(
                    alignment: AlignmentDirectional.center,
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(
                        side: BorderSide(color: Colors.white, width: 2)))),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0, left: 18.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 245, 1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width / 4,
                                //color: Colors.black12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black12),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Para utilizar IA (Inteligência Artificial) para auxiliar no reconhecimento e separação de materias recicláveis, siga as recomendações a seguir!',
                                  style: GoogleFonts.archivo(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(51, 111, 93, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            '1',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Fotos mal iluminadas dificultam o reconhecimento. Certifique-se de usar a camêra em um lugar bem iluminado. ',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(51, 111, 93, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            '2',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Fotos muito próximas ou distantes dificultam o reconhecimento. Certifique-se de usar a camêra em um distância considerável. ',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(51, 111, 93, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            '3',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'A IA não garante 100% de certeza nos reconhecimentos, afinal, se o ser humano é falho, imagina uma máquina.',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '?',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )
                  ],
                ),
                style: ButtonStyle(
                    alignment: AlignmentDirectional.center,
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(
                        side: BorderSide(color: Colors.white, width: 2)))),
              ),
            ),
          ),
        ),
      ]),
      //)
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
