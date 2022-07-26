import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/balita/views/widgets/textfield_custom.dart';

import '../controllers/balita_controller.dart';

class FormBalitaView extends StatefulWidget {
  final bool isEdit;
  const FormBalitaView({Key? key, this.isEdit = false}) : super(key: key);

  @override
  State<FormBalitaView> createState() => _FormBalitaViewState();
}

class _FormBalitaViewState extends State<FormBalitaView> {
  @override
  Widget build(BuildContext context) {
    final balitaController = Get.put(BalitaController);
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget.isEdit ? 'Form Edit balita' : 'Form Tambah balita'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            TextfieldCustom(
              inputType: TextInputType.text,
              nama: 'Nama Bayi',
              namaTextEdit: "Bayi",
              validator: (val) {},
            ),
            TextfieldCustom(
              inputType: TextInputType.text,
              nama: 'Tempat Lahir',
              namaTextEdit: "Bayi",
              validator: (val) {},
            ),
            TextfieldCustom(
              inputType: TextInputType.text,
              nama: 'Nama Ibu',
              namaTextEdit: "Bayi",
              validator: (val) {},
            ),
            TextfieldCustom(
              inputType: TextInputType.number,
              nama: 'Berat Badan',
              namaTextEdit: "Bayi",
              validator: (val) {},
            ),
            TextfieldCustom(
              inputType: TextInputType.number,
              nama: 'Tinggi Badan',
              namaTextEdit: "",
              validator: (val) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
