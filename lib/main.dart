// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:recycle_view/views/cadastro.dart';
// import 'package:recycle_view/views/tela_inicial.dart';
// import 'package:recycle_view/views/bemvindo_page.dart';
// // import 'package:recycle_view/views/cadastro.dart';
// import 'package:recycle_view/views/cadastro_de_pontos_page.dart';
// import 'package:recycle_view/views/graficos_page.dart';
// import 'package:recycle_view/views/papel_page.dart';
// // import 'package:recycle_view/views/login.dart';
// // import 'package:recycle_view/views/metal_page.dart';
// // import 'package:recycle_view/views/organico_page.dart';
// // import 'package:recycle_view/views/papel_page.dart';
// // import 'package:recycle_view/views/tela_inicial.dart';
// // import 'package:recycle_view/views/vidro_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MainApp());
// }

// class MainApp extends StatelessWidget {
//   MainApp({super.key});

// // Tela inicial (colocar em outra classe)
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       color: Color.fromRGBO(233, 233, 233, 1),
//       debugShowCheckedModeBanner: false,
//       home: Cadastro(),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recycle_view/views/login2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SJI Info',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 24.0,
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: const TextStyle(fontSize: 18.0),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
