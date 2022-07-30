import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/models/ibu.dart';
import '../../../utils/errors/error_hendler.dart';
import '../../balita/views/widgets/textfield_custom.dart';
import '../controllers/ibu_controller.dart';
import 'ibu_view.dart';

class FormIbuView extends StatefulWidget {
  final bool isEdit;
  final Ibu ibu;
  const FormIbuView({Key? key, this.isEdit = false, required this.ibu})
      : super(key: key);

  @override
  State<FormIbuView> createState() => _FormIbuViewState();
}

class _FormIbuViewState extends State<FormIbuView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Ibu? ibu = Ibu();

  @override
  void initState() {
    setState(() {
      ibu = widget.ibu;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ibuController = IbuController();
    final rangeFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isEdit ? 'Form Edit Ibu' : 'Form Tambah Ibu'),
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
                  initialValue: widget.ibu.nama ?? "",
                  inputType: TextInputType.text,
                  nama: 'Nama Ibu',
                  namaTextEdit: "Ibu",
                  onSaved: (val) {
                    setState(() {
                      ibu!.nama = val;
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
                              ibu!.tglLahir = pickedDate;
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
                              Text(rangeFormat.format(ibu!.tglLahir!)),
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
                  initialValue: ibu!.namaSuami ?? "",
                  onSaved: (val) {
                    setState(() {
                      ibu!.namaSuami = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Nama Suami',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: ibu!.alamat ?? "",
                  onSaved: (val) {
                    setState(() {
                      ibu!.alamat = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Alamat',
                  namaTextEdit: "Bayi",
                  validator: (val) =>
                      val!.isNotEmpty ? null : 'tidak boleh kosong',
                ),
                TextfieldCustom(
                  initialValue: ibu!.golDarah ?? "",
                  onSaved: (val) {
                    setState(() {
                      ibu!.golDarah = val;
                    });
                  },
                  inputType: TextInputType.text,
                  nama: 'Golongan Darah',
                  namaTextEdit: "Bayi",
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
                          ibuController.ubahIbu(ibu!).then((value) {
                            if (value) {
                              Future.delayed(const Duration(seconds: 3), () {
                                hideLoading();
                                Get.off(const IbuView());
                              });
                            }
                          });
                        } else {
                          ibuController.tambahIbu(ibu!).then((value) {
                            if (value) {
                              Future.delayed(const Duration(milliseconds: 1500),
                                  () {
                                Get.to(const IbuView());
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

  void onSave() async {}
}
