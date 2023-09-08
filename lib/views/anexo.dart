import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File? arquivo;
  Anexo({Key? key, this.arquivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              arquivo!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
