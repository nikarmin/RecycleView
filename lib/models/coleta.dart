class Coleta {
  int? metal;
  int? plastico;
  int? vidro;
  int? papel;

  Coleta(int? countMetal, int? countPlastico, int? countVidro, int? countPapel);

  Map<String, dynamic> toJson() => {
        'metal': metal,
        'plastico': plastico,
        'vidro': vidro,
        'papel': papel,
      };
}
