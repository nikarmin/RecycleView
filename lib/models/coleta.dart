import 'package:latlong2/latlong.dart';

class Coleta {
  String nome;
  LatLng localizacao;
  String endereco;
  String bairro;
  Coleta({
    required this.nome,
    required this.localizacao,
    required this.endereco,
    required this.bairro,
  });
}
