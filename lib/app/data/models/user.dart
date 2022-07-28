class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.alamat,
    this.role,
    this.isActive,
    this.dataKader,
  });

  int? id;
  String? name;
  String? phone;
  String? alamat;
  int? role;
  int? isActive;
  DataKader? dataKader;
  User.empty() {
    id = 0;
    name = '';
    phone = '';
    alamat = '';
    role = 0;
    isActive = 0;
  }
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        alamat: json["alamat"],
        role: json["role"],
        isActive: json["is_active"],
        dataKader: DataKader.fromJson(json["data_kader"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "alamat": alamat,
        "role": role,
        "is_active": isActive,
        "data_kader": dataKader!.toJson(),
      };
}

class DataKader {
  DataKader({
    this.totalBalita,
    this.totalIbu,
  });

  int? totalBalita;
  int? totalIbu;

  factory DataKader.fromJson(Map<String, dynamic> json) => DataKader(
        totalBalita: json["total_balita"],
        totalIbu: json["total_ibu"],
      );

  Map<String, dynamic> toJson() => {
        "total_balita": totalBalita,
        "total_ibu": totalIbu,
      };
}
