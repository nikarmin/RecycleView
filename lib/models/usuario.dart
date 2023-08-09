class Usuario {
  //final String uid;
  final String nome;
  final String email;
  final String senha;
  final int cep;
  final String? urlFoto;

  Usuario({
    this.urlFoto,
    //required this.uid,
    required this.nome,
    required this.email,
    required this.senha,
    required this.cep,
  });

  Map<String, dynamic> toJson() => {
        //'uid': uid,
        'nome': nome,
        'email': email,
        'senha': senha,
        'cep': cep,
      };

  Usuario.fromMap(Map<String, dynamic> map)
      : // uid = map['uid'],
        urlFoto = map['urlFoto'],
        nome = map['nome'],
        email = map['email'],
        senha = map['senha'],
        cep = map['cep'];

  Usuario.fromDocumentSnapshot(Map<String, dynamic> map)
      : //uid = map['uid'],
        urlFoto = map['urlFoto'],
        nome = map['nome'],
        email = map['email'],
        senha = map['senha'],
        cep = map['cep'];
}
