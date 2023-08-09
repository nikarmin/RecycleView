class Usuario {
  final String nome;
  final String email;
  final String senha;
  final int cep;

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
    required this.cep,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'email': email,
        'senha': senha,
        'cep': cep,
      };
}
