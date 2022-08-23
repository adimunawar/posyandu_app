import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/home/views/profile_view.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';

import '../../../balita/views/balita_view.dart';
import '../../../ibu_hamil/views/ibu_hamil_view.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            color: Colors.blue,
            height: Constanta.user.role == 1 ? 80 : 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat datang, ",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          color: Colors.white),
                    ),
                    Text("${Constanta.user.name}",
                        style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: semiBold))
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ProfileView());
                  },
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (Constanta.user.role == 1)
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const BalitaView());
                        },
                        child: Card(
                          child: Container(
                            width: screenWidth / 2 - 20,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Constanta.user.dataKader!.totalBalita}",
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Balita",
                                  style: primaryTextStyle.copyWith(
                                      fontSize: 16, fontWeight: semiBold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const IbuHamilView());
                        },
                        child: Card(
                          child: Container(
                            width: screenWidth / 2 - 20,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${Constanta.user.dataKader!.totalIbu}",
                                    style: primaryTextStyle.copyWith(
                                        fontWeight: semiBold)),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("Ibu Hamil",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
