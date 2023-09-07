import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/services/auth_service.dart';
import 'package:recycle_view/views/lalala.dart';
import 'package:recycle_view/views/mapa.dart';
import 'package:recycle_view/views/perfil_page.dart';
import 'package:recycle_view/widget/auth_check.dart';

import 'firebase_options.dart';

bool isLogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => AuthService(),
      ),
    ], child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Color.fromRGBO(233, 233, 233, 1),
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}
