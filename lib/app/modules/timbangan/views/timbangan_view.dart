import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/modules/timbangan/views/detail_timbangan_view.dart';
import 'package:posyandu_app/app/modules/timbangan/views/form_register_timbangan_view.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';
import '../../home/views/home_view.dart';
import '../controllers/timbangan_controller.dart';

class TimbanganView extends GetView<TimbanganController> {
  const TimbanganView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TimbanganController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const FormRegisterTimbanganView());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.off(const HomeView()),
            child: const Icon(Icons.arrow_back)),
        title: Text(
          'Kelola Timbangan',
          style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Balita>>(
          future: controller.getListTimbanganBalita(),
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
                            DetailTimbanganView(balita: snapshot.data![index]));
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
