import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/balita/bindings/balita_binding.dart';
import '../modules/balita/views/balita_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/ibu/bindings/ibu_binding.dart';
import '../modules/ibu/views/ibu_view.dart';
import '../modules/ibu_hamil/bindings/ibu_hamil_binding.dart';
import '../modules/ibu_hamil/views/ibu_hamil_view.dart';
import '../modules/imunisasi/bindings/imunisasi_binding.dart';
import '../modules/imunisasi/views/imunisasi_view.dart';
import '../modules/timbangan/bindings/timbangan_binding.dart';
import '../modules/timbangan/views/timbangan_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.BALITA,
      page: () => BalitaView(),
      binding: BalitaBinding(),
    ),
    GetPage(
      name: _Paths.IBU,
      page: () => IbuView(),
      binding: IbuBinding(),
    ),
    GetPage(
      name: _Paths.IBU_HAMIL,
      page: () => IbuHamilView(),
      binding: IbuHamilBinding(),
    ),
    GetPage(
      name: _Paths.TIMBANGAN,
      page: () => TimbanganView(),
      binding: TimbanganBinding(),
    ),
    GetPage(
      name: _Paths.IMUNISASI,
      page: () => ImunisasiView(),
      binding: ImunisasiBinding(),
    ),
  ];
}
