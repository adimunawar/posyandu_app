import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/models/timbangan.dart';
import 'package:posyandu_app/app/modules/timbangan/controllers/timbangan_controller.dart';
import 'package:posyandu_app/app/utils/age_calculator.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';

class DetailTimbanganView extends GetView<TimbanganController> {
  final Balita balita;
  const DetailTimbanganView({Key? key, required this.balita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TimbanganController();
    final tanggalFormat = DateFormat(
      'dd/MM/yyyy',
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          balita.childName!,
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama Balita",
                        style: primaryTextStyle,
                      ),
                      Text(
                        balita.childName ?? "",
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal Lahir",
                        style: primaryTextStyle,
                      ),
                      Text(tanggalFormat.format(balita.birthDate!),
                          style: primaryTextStyle)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Umur",
                        style: primaryTextStyle,
                      ),
                      Text(AgeCalculator.calculateAge(balita.birthDate!))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama Ortu",
                        style: primaryTextStyle,
                      ),
                      Text(balita.motherName!, style: primaryTextStyle)
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              "Riwayat Timbangan",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
          ),
          // list timbangan
          FutureBuilder<List<Timbangan>>(
              future: controller.getRiwayatTimbangan(balita.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("data kosong"),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              // Get.to(
                              //     DetailTimbanganView(balita: snapshot.data![index]));
                            },
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tanggal Timbang:",
                                          style: primaryTextStyle,
                                        ),
                                        Text(
                                          tanggalFormat.format(
                                              snapshot.data![index].createdAt!),
                                          style: primaryTextStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Berat Badan:",
                                          style: primaryTextStyle,
                                        ),
                                        Text(
                                          "${snapshot.data![index].bb} Kg",
                                          style: primaryTextStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tinggi Badan:",
                                          style: primaryTextStyle,
                                        ),
                                        Text(
                                          "${snapshot.data![index].tb} Cm",
                                          style: primaryTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))),
                );
              }),
        ],
      ),
    );
  }
}
