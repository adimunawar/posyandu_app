class Balita {
  Balita({
    this.id,
    this.childName,
    this.idStaf,
    this.birthDate,
    this.weight,
    this.height,
    this.gender,
    this.category,
    this.birthPlace,
    this.motherName,
    this.createdAt,
    this.helper,
  });

  int? id;
  String? childName;
  int? idStaf;
  DateTime? birthDate;
  int? weight;
  int? height;
  String? gender;
  String? category;
  String? birthPlace;
  String? motherName;
  DateTime? createdAt;
  String? helper;

  Balita.isEmpty() {
    id = 0;
    childName = '';
    idStaf = 0;
    birthDate = DateTime.now();
    weight = 0;
    height = 0;
    category = '';
    gender = '';
    motherName = '';
    birthPlace = '';
    helper = '';
  }
  factory Balita.fromJson(Map<String, dynamic> json) => Balita(
        id: json["id"],
        childName: json["child_name"],
        idStaf: json["id_staf"],
        birthDate: DateTime.parse(json["birth_date"]),
        weight: json["weight"],
        height: json["height"],
        gender: json["gender"],
        category: json["category"],
        motherName: json['mother_name'],
        birthPlace: json['birth_place'],
        helper: json['helper'],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "child_name": childName,
        "id_staf": idStaf,
        "birth_date": birthDate?.toIso8601String(),
        "weight": weight,
        "height": height,
        "gender": gender,
        "category": category,
        "helper": helper,
        "created_at": createdAt!.toIso8601String(),
      };
}
