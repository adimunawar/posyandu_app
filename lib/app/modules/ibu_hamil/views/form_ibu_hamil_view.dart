import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import '../../../data/models/ibu.dart';
import '../../../data/models/ibu_hamil.dart';

import '../../../utils/errors/error_hendler.dart';
import '../../balita/views/widgets/textfield_custom.dart';

import '../controllers/ibu_hamil_controller.dart';
import 'ibu_hamil_view.dart';

class FormIbuHamilView extends StatefulWidget {
  final bool isEdit;
  final IbuHamil ibu;
  const FormIbuHamilView({Key? key, this.isEdit = false, required this.ibu})
      : super(key: key);

  @override
  State<FormIbuHamilView> createState() => _FormIbuHamilViewState();
}

class _FormIbuHamilViewState extends State<FormIbuHamilView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  IbuHamil? ibu;
  bool isOntap = false;
  Ibu? dropdownValue;
  @override
  void initState() {
    setState(() {
      ibu = widget.ibu;
      if (widget.isEdit) {
        dropdownValue = Constanta.listIbu
            .singleWhere((element) => element.id == widget.ibu.idIbu!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ibuController = IbuHamilController();
    final rangeFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
        appBar: AppBar(
          title: Text(
              widget.isEdit ? 'Form Edit Ibu Hamil' : 'Form Tambah Ibu Hamil'),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Nama Ibu"),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: DropdownButton<Ibu>(
                    isDense: false,
                    focusColor: Colors.white,
                    hint: widget.isEdit ? SizedBox() : Text("Pilih Ibu"),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 2,
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        ibu!.idIbu = newValue!.id;
                      });
                    },
                    items: Constanta.listIbu
                        .map<DropdownMenuItem<Ibu>>((Ibu value) {
                      return DropdownMenuItem<Ibu>(
                        value: value,
                        child: Text(value.nama ?? ""),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextfieldCustom(
                  initialValue: widget.ibu.hamilKe == null
                      ? "0"
                      : "${widget.ibu.hamilKe}",
                  inputType: TextInputType.number,
                  nama: 'Hamil ke',
                  namaTextEdit: "Ibu",
                  onSaved: (val) {
                    setState(() {
                      ibu!.hamilKe = int.tryParse(val);
                    });
                  },
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: widget.ibu.umurKehamilan == null
                      ? "0"
                      : "${widget.ibu.umurKehamilan}",
                  inputType: TextInputType.number,
                  nama: 'Umur kehamilan',
                  namaTextEdit: "Ibu",
                  onSaved: (val) {
                    setState(() {
                      ibu!.umurKehamilan = int.tryParse(val);
                    });
                  },
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: widget.ibu.tempatPeriksa ?? "",
                  inputType: TextInputType.text,
                  nama: 'Tempat Periksa',
                  namaTextEdit: "Ibu",
                  onSaved: (val) {
                    setState(() {
                      ibu!.tempatPeriksa = val;
                    });
                  },
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Terakhir haid"),
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
                              ibu!.haidTerakhir = pickedDate;
                            });
                          } else {
                            ibu!.haidTerakhir = DateTime.now();
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
                              Text(rangeFormat
                                  .format(ibu!.haidTerakhir ?? DateTime.now())),
                              const Icon(Icons.calendar_month)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () async {
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        if (widget.isEdit) {
                          ibuController.ubahIbuHamil(ibu!).then((value) {
                            if (value) {
                              Future.delayed(const Duration(seconds: 3), () {
                                hideLoading();
                                Get.off(const IbuHamilView());
                              });
                            }
                          });
                        } else {
                          ibuController.tambahIbu(ibu!).then((value) {
                            if (value) {
                              Future.delayed(const Duration(milliseconds: 1500),
                                  () {
                                Get.off(const IbuHamilView());
                              });
                            }
                          });
                        }
                        // await IbuController
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
