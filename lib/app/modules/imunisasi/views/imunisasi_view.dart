import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/imunisasi/views/detail_imunisasi_view.dart';

import '../../../data/models/balita.dart';
import '../../../utils/theme/fonts_style.dart';
import '../controllers/imunisasi_controller.dart';

class ImunisasiView extends GetView<ImunisasiController> {
  const ImunisasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ImunisasiController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kelola Timbangan',
          style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Balita>>(
          future: controller.getListImunisasiBalita(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("data kosong"),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        Get.to(
                            DetailImunisasiView(balita: snapshot.data![index]));
                      },
                      child: Card(
                        margin:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: ListTile(
                          leading: Text(
                            snapshot.data![index].childName!,
                            style: primaryTextStyle,
                          ),
                        ),
                      ),
                    )));
          }),
    );
  }
}
