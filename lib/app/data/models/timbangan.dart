class Timbangan {
  Timbangan({
    this.id,
    this.idAnak,
    this.bb,
    this.tb,
    this.createdAt,
  });

  int? id;
  int? idAnak;
  int? bb;
  int? tb;
  DateTime? createdAt;

  factory Timbangan.fromJson(Map<String, dynamic> json) => Timbangan(
        id: json["id"],
        idAnak: json["id_anak"],
        bb: json["bb"],
        tb: json["tb"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_anak": idAnak,
        "bb": bb,
        "tb": tb,
        "created_at": createdAt!.toIso8601String(),
      };
}
