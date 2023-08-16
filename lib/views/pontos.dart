import 'package:flutter/material.dart';

import 'perfil_page.dart';

class PontosPage extends StatefulWidget {
  const PontosPage({super.key});

  @override
  State<PontosPage> createState() => _PontosPageState();
}

class _PontosPageState extends State<PontosPage> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
