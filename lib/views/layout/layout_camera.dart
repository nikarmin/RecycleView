import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraLayout {
  static final _picker = ImagePicker();

  static Future<File> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    return File(pickedFile!.path);
  }
}
