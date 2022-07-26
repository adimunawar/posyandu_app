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
  });

  int? id;
  String? childName;
  int? idStaf;
  DateTime? birthDate;
  int? weight;
  int? height;
  String? gender;
  int? category;

  factory Balita.fromJson(Map<String, dynamic> json) => Balita(
        id: json["id"],
        childName: json["child_name"],
        idStaf: json["id_staf"],
        birthDate: DateTime.parse(json["birth_date"]),
        weight: json["weight"],
        height: json["height"],
        gender: json["gender"],
        category: json["category"],
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
      };
}
