import 'package:posyandu_app/app/data/models/balita.dart';

import '../data/models/ibu.dart';
import '../data/models/user.dart';

class Constanta {
  static String baseUrl = "http://192.168.43.39:8082/";
  static User user = User.empty();
  static List<Ibu> listIbu = [];
  static List<Balita> listBalita = [];
  static List<String> jenisImunisasi = [
    "DPT",
    "BCG",
    "MR/MMR",
    "Hepatitis B",
    "Hemophilus Influenza B",
    "Flu atau Influenza",
    "Pneumokokus(PCV)",
    "IPV(Polio)",
    "Rotavirus",
    "Varisela",
    "Hepatitis A",
    "Tifoid",
    "Japanese encephalitis(JE)",
    "Dengue(DBD)",
  ];
  List<String> golonganDarah = ["A", "B", "AB", "O"];
}
