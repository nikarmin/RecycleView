import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestIa extends StatefulWidget {
  const TestIa({super.key});

  @override
  State<TestIa> createState() => _TestIaState();
}

class _TestIaState extends State<TestIa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController> (
        init: ScanController(),
        buil
      )
    );
  }
}