import 'dart:typed_data';

class Usuario {
  //final String uid;
  final String nome;
  final String email;
  final String senha;
  final int cep;
  final String? urlFoto;
  final int? countMetal, countPapel, countPlastico, countVidro;

  Usuario({
    required this.urlFoto,
    required this.nome,
    required this.email,
    required this.senha,
    required this.cep,
    required this.countMetal,
    required this.countPapel,
    required this.countPlastico,
    required this.countVidro,
  });

  Map<String, dynamic> toJson() => {
        //'uid': uid,
        'nome': nome,
        'email': email,
        'senha': senha,
        'cep': cep,
        'urlFoto': urlFoto,
        'qtdMetal': countMetal,
        'qtdPapel': countPapel,
        'qtdPlastico': countPlastico,
        'qtdVidro': countVidro,
      };

  Usuario.fromMap(Map<String, dynamic> map)
      : // uid = map['uid'],
        urlFoto = map['urlFoto'],
        nome = map['nome'],
        email = map['email'],
        senha = map['senha'],
        cep = map['cep'],
        countMetal = map['qtdMetal'],
        countPapel = map['qtdPapel'],
        countPlastico = map['qtdPlastico'],
        countVidro = map['qtdVidro'];

  Usuario.fromDocumentSnapshot(Map<String, dynamic> map)
      : //uid = map['uid'],
        urlFoto = map['urlFoto'],
        nome = map['nome'],
        email = map['email'],
        senha = map['senha'],
        cep = map['cep'],
        countMetal = map['qtdMetal'],
        countPapel = map['qtdPapel'],
        countPlastico = map['qtdPlastico'],
        countVidro = map['qtdVidro'];
}
