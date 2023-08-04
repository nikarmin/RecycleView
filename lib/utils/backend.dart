import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'dart:io';

void main() {
  startServer();
}

Future<void> startServer() async {
  final servidor = await shelf_io.serve(
      (request) => Response(200, body: 'YO FAKE NATTY'), 'localhost', 8080);

  print('Servidor rodando em http://${servidor.address.host}:${servidor.port}');
}


// void main() async {
//   final servidor = await shelf_io.serve(
//       (request) => Response(200, body: 'YO FAKE NATTY'), 'localhost', 8080);

//   print('Servidor rodando em http://${servidor.address.host}:${servidor.port}');
// }
