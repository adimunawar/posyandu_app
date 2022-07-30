class Ibu {
  Ibu({
    this.id,
    this.nama,
    this.namaSuami,
    this.tglLahir,
    this.alamat,
    this.golDarah,
    this.idStaf,
    this.posyandu,
  });

  int? id;
  String? nama;
  String? namaSuami;
  DateTime? tglLahir;
  String? alamat;
  String? golDarah;
  int? idStaf;
  String? posyandu;

  factory Ibu.fromJson(Map<String, dynamic> json) => Ibu(
        id: json["id"],
        nama: json["nama"],
        namaSuami: json["nama_suami"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        alamat: json["alamat"],
        golDarah: json["gol_darah"],
        idStaf: json["id_staf"],
        posyandu: json["posyandu"],
      );

  Ibu.isEmpty() {
    id = 0;
    nama = '';
    namaSuami = '';
    tglLahir = DateTime.now();
    alamat = "";
    golDarah = "";
    idStaf = 0;
    posyandu = "";
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nama_suami": namaSuami,
        "tgl_lahir": tglLahir?.toIso8601String(),
        "alamat": alamat,
        "gol_darah": golDarah,
        "id_staf": idStaf,
        "posyandu": posyandu,
      };
}
