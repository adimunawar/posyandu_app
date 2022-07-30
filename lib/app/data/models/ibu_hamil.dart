class IbuHamil {
  IbuHamil({
    this.id,
    this.nama,
    this.namaSuami,
    this.tglLahir,
    this.alamat,
    this.golDarah,
    this.idStaf,
    this.posyandu,
    this.idIbu,
    this.hamilKe,
    this.umurKehamilan,
    this.tempatPeriksa,
    this.haidTerakhir,
    this.createdAt,
    this.statusEkonomi,
  });

  int? id;
  String? nama;
  String? namaSuami;
  DateTime? tglLahir;
  String? alamat;
  String? golDarah;
  int? idStaf;
  String? posyandu;
  int? idIbu;
  int? hamilKe;
  int? umurKehamilan;
  String? tempatPeriksa;
  DateTime? haidTerakhir;
  DateTime? createdAt;
  String? statusEkonomi;

  factory IbuHamil.fromJson(Map<String, dynamic> json) {
    return IbuHamil(
      id: json["id"],
      nama: json["nama"],
      namaSuami: json["nama_suami"],
      tglLahir: DateTime.parse(json["tgl_lahir"]),
      alamat: json["alamat"],
      golDarah: json["gol_darah"],
      idStaf: json["id_staf"],
      posyandu: json["posyandu"],
      idIbu: json["id_ibu"],
      hamilKe: json["hamil_ke"],
      umurKehamilan: json["umur_kehamilan"],
      tempatPeriksa: json["tempat_periksa"],
      haidTerakhir: DateTime.parse(json["haid_terakhir"]),
      createdAt: DateTime.parse(json["created_at"]),
      statusEkonomi: json["status_ekonomi"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nama_suami": namaSuami,
        "tgl_lahir": tglLahir!.toIso8601String(),
        "alamat": alamat,
        "gol_darah": golDarah,
        "id_staf": idStaf,
        "posyandu": posyandu,
        "id_ibu": idIbu,
        "hamil_ke": hamilKe,
        "umur_kehamilan": umurKehamilan,
        "tempat_periksa": tempatPeriksa,
        "haid_terakhir": haidTerakhir!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "status_ekonomi": statusEkonomi,
      };
}
