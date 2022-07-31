import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/models/timbangan.dart';
import 'package:posyandu_app/app/modules/timbangan/controllers/timbangan_controller.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';

class DetailTimbanganView extends GetView<TimbanganController> {
  final Balita balita;
  const DetailTimbanganView({Key? key, required this.balita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TimbanganController();
    final tanggalFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          balita.childName!,
          style: primaryTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Nama Balita",
                    style: primaryTextStyle,
                  ),
                  trailing: Text(balita.childName ?? ""),
                ),
                ListTile(
                  title: Text("Tanggal Lahir", style: primaryTextStyle),
                  trailing: Text(tanggalFormat.format(balita.birthDate!),
                      style: primaryTextStyle),
                ),
                ListTile(
                  title: Text("Nama Ortu", style: primaryTextStyle),
                  trailing: Text(balita.motherName!, style: primaryTextStyle),
                ),
              ],
            ),
          ),
          Text(
            "Riwayat Timbangan",
            style: primaryTextStyle,
          ),
          // lis timbangan
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
                              child: ListTile(
                                leading: Text(
                                  "${snapshot.data![index].bb}",
                                  style: primaryTextStyle,
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
