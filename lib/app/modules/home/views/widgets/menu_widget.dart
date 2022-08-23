import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/balita/views/balita_view.dart';
import 'package:posyandu_app/app/modules/home/views/info_app_view.dart';
import 'package:posyandu_app/app/modules/home/views/info_imunisasi_view.dart';
import 'package:posyandu_app/app/modules/home/views/notifikasi_view.dart';
import 'package:posyandu_app/app/modules/home/views/user_guide_view.dart';
import 'package:posyandu_app/app/modules/jadwal/views/jadwal_view.dart';
import 'package:posyandu_app/app/modules/timbangan/views/timbangan_view.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';

import '../../../ibu/views/ibu_view.dart';
import '../../../ibu_hamil/views/ibu_hamil_view.dart';
import '../../../imunisasi/views/imunisasi_view.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Menu",
            style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 14,
            spacing: 6.0,
            clipBehavior: Clip.antiAlias,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              // ItemMenuCard(
              //   onTap: () {
              //     Get.to(const BalitaView());
              //   },
              //   imagePath: 'assets/images/baby.png',
              //   title: 'Balita',
              // ),
              // ItemMenuCard(
              //   onTap: () {
              //     Get.to(const IbuView());
              //   },
              //   imagePath: 'assets/images/mother_2.png',
              //   title: 'Ibu',
              // ),
              // ItemMenuCard(
              //   onTap: () {
              //     Get.to(const IbuHamilView());
              //   },
              //   imagePath: 'assets/images/pregnant.png',
              //   title: 'Ibu Hamil',
              // ),
              // ItemMenuCard(
              //   onTap: () {
              //     Get.to(const TimbanganView());
              //   },
              //   imagePath: 'assets/images/mother.png',
              //   title: 'Penimbangan',
              // ),
              // ItemMenuCard(
              //   onTap: () {
              //     Get.to(const ImunisasiView());
              //   },
              //   imagePath: 'assets/images/injection.png',
              //   title: 'Imunisasi',
              // ),
              // ItemMenuCard(
              //   onTap: () {},
              //   imagePath: 'assets/images/baby-food.png',
              //   title: 'Gizi',
              // ),
              ItemMenuCard(
                onTap: () {
                  Get.to(const UserGuideView());
                },
                imagePath: 'assets/images/user_guide.png',
                title: 'Penggunaan',
              ),
              ItemMenuCard(
                onTap: () {
                  Get.to(const UserGuideView());
                },
                imagePath: 'assets/images/add_event.png',
                title: 'Buat Jadwal',
              ),
              ItemMenuCard(
                onTap: () {
                  Get.to(JadwalView());
                },
                imagePath: 'assets/images/timetable.png',
                title: 'Jadwal Imunisasi',
              ),
              ItemMenuCard(
                onTap: () {
                  Get.to(InfoImunisasiView());
                },
                imagePath: 'assets/images/guide_book.png',
                title: 'Info Imunisisasi',
              ),
              ItemMenuCard(
                onTap: () {
                  Get.to(NotifikasiView());
                },
                imagePath: 'assets/images/notification.png',
                title: 'Notifikasi',
              ),
              ItemMenuCard(
                onTap: () {
                  Get.to(InfoAppView());
                },
                imagePath: 'assets/images/smartphone.png',
                title: 'Tentang Aplikasi',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemMenuCard extends StatelessWidget {
  final Function onTap;
  final String title;
  final String imagePath;
  const ItemMenuCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: screenWidth / 3 - 15,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                imagePath,
                height: 50,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 80,
              child: Text(
                title,
                style: primaryTextStyle.copyWith(fontSize: 13),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
