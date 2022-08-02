import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/modules/balita/views/balita_view.dart';
import 'package:posyandu_app/app/modules/balita/views/widgets/textfield_custom.dart';
import '../../../utils/errors/error_hendler.dart';
import '../controllers/balita_controller.dart';

class FormBalitaView extends StatefulWidget {
  final bool isEdit;
  final Balita balita;
  const FormBalitaView({Key? key, this.isEdit = false, required this.balita})
      : super(key: key);

  @override
  State<FormBalitaView> createState() => _FormBalitaViewState();
}

class _FormBalitaViewState extends State<FormBalitaView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Balita? balita = Balita();

  @override
  void initState() {
    setState(() {
      balita = widget.balita;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final balitaController = BalitaController();
    final rangeFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget.isEdit ? 'Form Edit balita' : 'Form Tambah balita'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                TextfieldCustom(
                  initialValue: widget.balita.childName!,
                  inputType: TextInputType.text,
                  nama: 'Nama Bayi',
                  namaTextEdit: "Bayi",
                  onSaved: (val) {
                    setState(() {
                      balita!.childName = val;
                    });
                  },
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: balita!.birthPlace ?? "",
                  onSaved: (val) {
                    setState(() {
                      balita!.birthPlace = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Tempat Lahir',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tanggal Lahir"),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            setState(() {
                              balita!.birthDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade500)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(rangeFormat.format(balita!.birthDate!)),
                              const Icon(Icons.calendar_month)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextfieldCustom(
                  initialValue: balita!.motherName ?? "",
                  onSaved: (val) {
                    setState(() {
                      balita!.motherName = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Nama Ibu',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: balita!.gender ?? "",
                  onSaved: (val) {
                    setState(() {
                      balita!.gender = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Jenis Kelamin',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: balita!.helper ?? "",
                  onSaved: (val) {
                    setState(() {
                      balita!.helper = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Penolong',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: balita!.category ?? "",
                  onSaved: (val) {
                    setState(() {
                      balita!.category = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Kelahiran',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: widget.balita.weight.toString(),
                  onSaved: (val) {
                    setState(() {
                      balita!.category = val;
                    });
                  },
                  inputType: TextInputType.number,
                  nama: 'Berat Badan',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: widget.balita.height.toString(),
                  onSaved: (val) {
                    setState(() {
                      balita!.height = int.parse(val);
                    });
                  },
                  inputType: TextInputType.number,
                  nama: 'Tinggi Badan',
                  namaTextEdit: "",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () async {
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        if (widget.isEdit) {
                          balitaController.ubahBalita(balita!).then((value) {
                            if (value) {
                              Future.delayed(const Duration(seconds: 3), () {
                                hideLoading();
                                Get.off(const BalitaView());
                              });
                            }
                          });
                        } else {
                          Get.to(const BalitaView());
                          balitaController.tambahBalita(balita!).then((value) {
                            if (value) {
                              Get.offAll(const BalitaView());
                            }
                          });
                        }
                        // await balitaController
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue),
                      child: Center(
                        child: Text(
                          "Simpan",
                          style: Get.textTheme.bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ));
  }
}
