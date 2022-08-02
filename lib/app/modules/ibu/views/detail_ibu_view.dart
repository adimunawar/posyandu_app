import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:posyandu_app/app/modules/ibu/views/ibu_view.dart';
import 'package:posyandu_app/app/utils/helpers/dialog_helper.dart';

import '../../../data/models/ibu.dart';
import '../controllers/ibu_controller.dart';
import 'form_ibu_view.dart';

class DetailIbuView extends GetView {
  final Ibu ibu;
  const DetailIbuView({Key? key, required this.ibu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tanggalFormat = DateFormat('dd/MM/yyyy');
    final controller = IbuController();
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
              "Nama Ibu ",
            ),
            trailing: Text(
              ibu.nama ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Tanggal lahir ",
            ),
            trailing: Text(
              tanggalFormat.format(ibu.tglLahir!),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Nama suami",
            ),
            trailing: Text(
              ibu.namaSuami ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Alamat",
            ),
            trailing: Text(
              ibu.alamat ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Text(
              "Golongan darah ",
            ),
            trailing: Text(
              ibu.golDarah ?? "",
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
              onTap: (() => Get.to(FormIbuView(
                    ibu: ibu,
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
                    controller.hapusIbu(ibu.id!).then((value) {
                      if (value) {
                        Get.offAll(const IbuView());
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
