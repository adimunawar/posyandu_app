class Historybaby {
  Historybaby({
    this.id,
    this.idAnak,
    this.tglTimbang,
    this.tglImunisasi,
    this.namaImunisasi,
    this.pemberianAsi,
    this.vitaminA,
    this.beratBadan,
    this.tinggiBadan,
  });

  int? id;
  int? idAnak;
  DateTime? tglTimbang;
  DateTime? tglImunisasi;
  String? namaImunisasi;
  String? pemberianAsi;
  String? vitaminA;
  int? beratBadan;
  int? tinggiBadan;

  factory Historybaby.fromJson(Map<String, dynamic> json) => Historybaby(
        id: json["id"],
        idAnak: json["id_anak"],
        tglTimbang: DateTime.parse(json["tgl_timbang"]),
        tglImunisasi: DateTime.parse(json["tgl_imunisasi"]),
        namaImunisasi: json["nama_imunisasi"],
        pemberianAsi: json["pemberian_asi"],
        vitaminA: json["vitamin_a"],
        beratBadan: json["berat_badan"],
        tinggiBadan: json["tinggi_badan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_anak": idAnak,
        "tgl_timbang": tglTimbang!.toIso8601String(),
        "tgl_imunisasi": tglImunisasi!.toIso8601String(),
        "nama_imunisasi": namaImunisasi,
        "pemberian_asi": pemberianAsi,
        "vitamin_a": vitaminA,
        "berat_badan": beratBadan,
        "tinggi_badan": tinggiBadan,
      };
}
