import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/modules/balita/views/balita_view.dart';
import 'package:posyandu_app/app/modules/balita/views/widgets/textfield_custom.dart';
import 'package:posyandu_app/app/utils/constants.dart';

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
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget.isEdit ? 'Form Edit balita' : 'Form Tambah balita'),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Column(
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
                    val!.length > 1 ? null : 'tidak boleh kosong',
              ),
              // TextfieldCustom(
              //   onSaved: (val) {
              //     setState(() {
              //       balita!.childName = val;
              //     });
              //   },
              //   inputType: TextInputType.text,
              //   nama: 'Tempat Lahir',
              //   namaTextEdit: "Bayi",
              //   validator: (val) =>
              //       val!.length > 1 ? null : 'tidak boleh kosong',
              // ),
              // TextfieldCustom(
              //   onSaved: (val) {
              //     setState(() {
              //       balita!.childName = val;
              //     });
              //   },
              //   inputType: TextInputType.text,
              //   nama: 'Nama Ibu',
              //   namaTextEdit: "Bayi",
              //   validator: (val) =>
              //       val!.length > 1 ? null : 'tidak boleh kosong',
              // ),
              TextfieldCustom(
                initialValue: widget.balita.weight.toString(),
                onSaved: (val) {
                  setState(() {
                    balita!.weight = int.parse(val);
                  });
                },
                inputType: TextInputType.number,
                nama: 'Berat Badan',
                namaTextEdit: "Bayi",
                validator: (val) =>
                    val!.length > 1 ? null : 'tidak boleh kosong',
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
                    val!.length > 1 ? null : 'tidak boleh kosong',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () async {
                    final form = formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      balita!.birthDate = DateTime.now();
                      // balita!.id = Constanta.userId;
                      balita!.gender = "Laki - laki";
                      balita!.category = "Spontan";
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
                        balitaController.tambahBalita(balita!).then((value) {
                          if (value) {
                            Get.to(const BalitaView());
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
              )
            ],
          ),
        ));
  }

  void onSave() async {}
}
