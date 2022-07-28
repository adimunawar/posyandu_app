import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/modules/balita/controllers/balita_controller.dart';
import 'package:posyandu_app/app/modules/balita/views/balita_view.dart';
import 'package:posyandu_app/app/modules/balita/views/form_balita_view.dart';
import 'package:posyandu_app/app/utils/helpers/dialog_helper.dart';

class DetailBalitaView extends GetView {
  final Balita balita;
  const DetailBalitaView({Key? key, required this.balita}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tanggalFormat = DateFormat('dd/MM/yyyy');
    final controller = BalitaController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Balita'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Text(
              "Nama Balita ",
            ),
            trailing: Text(
              balita.childName!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            minVerticalPadding: 0,
            leading: const Text(
              "Tempat Lahir ",
            ),
            trailing: Text(
              balita.birthPlace!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Tanggal lahir ",
            ),
            trailing: Text(
              tanggalFormat.format(balita.birthDate!),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Jenis Kelamin",
            ),
            trailing: Text(
              balita.gender!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "nama Ibu",
            ),
            trailing: Text(
              balita.motherName!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Tanggal pendatan ",
            ),
            trailing: Text(
              tanggalFormat.format(balita.createdAt ?? DateTime.now()),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ]),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (() => Get.to(FormBalitaView(
                    balita: balita,
                    isEdit: true,
                  ))),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Center(
                  child: Text(
                    "Edit",
                    style:
                        Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                DialogHelper.confirmDialod(
                  onTap: () {
                    controller.hapusBalita(balita.id!).then((value) {
                      if (value) {
                        Get.to(const BalitaView());
                      }
                    });
                  },
                  title: 'Hapus',
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Center(
                  child: Text("hapus",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
