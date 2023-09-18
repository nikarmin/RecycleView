import 'dart:typed_data';

class Usuario {
  //final String uid;
  final String nome;
  final String email;
  final String senha;
  final int cep;
  final String? urlFoto;
  //final List<Coleta>? listaColeta;

  Usuario({
    required this.urlFoto,
    required this.nome,
    required this.email,
    required this.senha,
    required this.cep,
    //required this.listaColeta,
  });

  Map<String, dynamic> toJson() => {
        //'uid': uid,
        'nome': nome,
        'email': email,
        'senha': senha,
        'cep': cep,
        'urlFoto': urlFoto,
        // 'listaColeta': listaColeta == null ? '0' : listaColeta,
      };

  Usuario.fromMap(Map<String, dynamic> map)
      : // uid = map['uid'],
        urlFoto = map['urlFoto'],
        nome = map['nome'],
        email = map['email'],
        senha = map['senha'],
        cep = map['cep'];
  //listaColeta = map['listaColeta'];

  Usuario.fromDocumentSnapshot(Map<String, dynamic> map)
      : //uid = map['uid'],
        urlFoto = map['urlFoto'],
        nome = map['nome'],
        email = map['email'],
        senha = map['senha'],
        cep = map['cep'];
  //listaColeta = map['listaColeta'];
}
