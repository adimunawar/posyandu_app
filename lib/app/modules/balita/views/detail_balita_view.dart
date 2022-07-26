import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/modules/balita/views/form_balita_view.dart';

class DetailBalitaView extends GetView {
  final Balita balita;
  const DetailBalitaView({Key? key, required this.balita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deatail Balita'),
        centerTitle: true,
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 8,
        ),
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
          leading: const Text(
            "Tanggal lahir ",
          ),
          trailing: Text(
            balita.birthDate.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const ListTile(
          leading: Text(
            "Tempat lahir ",
          ),
          trailing: Text(
            "tasikmalaya",
            style: TextStyle(fontWeight: FontWeight.w600),
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
        const ListTile(
          leading: Text(
            "nama Ibu",
          ),
          trailing: Text(
            "Lilis",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ]),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (() => Get.to(const FormBalitaView(
                    isEdit: true,
                  ))),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: const Center(
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              height: 40,
              width: MediaQuery.of(context).size.width / 2 - 30,
              child: const Center(
                child: Text("hapus"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
