import 'package:flutter/material.dart';
import 'package:recycle_view/views/bem-vindo_page.dart';
import 'package:recycle_view/views/cadastro.dart';
import 'package:recycle_view/views/cadastro_de_pontos_page.dart';
import 'package:recycle_view/views/login.dart';
import 'package:recycle_view/views/metal_page.dart';
import 'package:recycle_view/views/organico_page.dart';
import 'package:recycle_view/views/papel_page.dart';
import 'package:recycle_view/views/tela_inicial.dart';
import 'package:recycle_view/views/vidro_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

// Tela inicial (colocar em outra classe)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromRGBO(233, 233, 233, 1),
      debugShowCheckedModeBanner: false,
      home: CadastroDePontosPage(),
    );
  }
}