class Imunisasi {
  Imunisasi({
    this.id,
    this.jenisImunisasi,
    this.createdAt,
    this.idAnak,
  });

  int? id;
  String? jenisImunisasi;
  DateTime? createdAt;
  int? idAnak;

  factory Imunisasi.fromJson(Map<String, dynamic> json) => Imunisasi(
        id: json["id"],
        jenisImunisasi: json["jenis_imunisasi"],
        createdAt: DateTime.parse(json["created_at"]),
        idAnak: json["id_anak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_imunisasi": jenisImunisasi,
        "created_at": createdAt!.toIso8601String(),
        "id_anak": idAnak,
      };
}
