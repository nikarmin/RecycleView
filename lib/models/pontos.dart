class Pontos {
  double? lat;
  double? long;
  String? nome;

  Pontos({this.lat, this.long, this.nome});

  Map<String, dynamic> toJson() => {'nome': nome, 'lat': lat, 'long': long};

  Pontos.fromMap(Map<String, dynamic> map)
      : nome = map['nome'],
        lat = map['lat'],
        long = map['long'];

  Pontos.fromDocumentSnapshot(Map<String, dynamic> map)
      : nome = map['nome'],
        lat = map['lat'],
        long = map['long'];
}
