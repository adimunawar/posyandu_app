import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/modules/balita/views/detail_balita_view.dart';
import 'package:posyandu_app/app/modules/balita/views/form_balita_view.dart';
import 'package:posyandu_app/app/modules/home/views/home_view.dart';
import 'package:posyandu_app/app/utils/age_calculator.dart';

import '../controllers/balita_controller.dart';

class BalitaView extends GetView<BalitaController> {
  const BalitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BalitaController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Get.to(FormBalitaView(
            balita: Balita.isEmpty(),
          ));
        }),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.off(const HomeView()),
            child: const Icon(Icons.arrow_back)),
        title: const Text("Kelola Balita"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Balita>>(
          future: controller.getListBalita(),
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
                        Get.to(DetailBalitaView(balita: snapshot.data![index]));
                      },
                      child: Card(
                        margin:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: ListTile(
                          leading: const Icon(Icons.child_care),
                          title: Text(snapshot.data![index].childName!),
                          trailing: Text(AgeCalculator.calculateAge(
                              snapshot.data![index].birthDate!)),
                        ),
                      ),
                    )));
          }),
    );
  }
}
