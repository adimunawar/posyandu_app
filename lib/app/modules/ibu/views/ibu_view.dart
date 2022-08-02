import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/ibu.dart';
import '../../home/views/home_view.dart';
import '../controllers/ibu_controller.dart';
import 'detail_ibu_view.dart';
import 'form_ibu_view.dart';

class IbuView extends GetView<IbuController> {
  const IbuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = IbuController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.off(const HomeView()),
            child: const Icon(Icons.arrow_back)),
        title: const Text('Kelola Ibu'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Get.to(FormIbuView(
            ibu: Ibu.isEmpty(),
          ));
        }),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Ibu>>(
          future: controller.getListIbu(),
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
                        Get.to(DetailIbuView(ibu: snapshot.data![index]));
                      },
                      child: Card(
                        margin:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: ListTile(
                          leading: Text(snapshot.data![index].nama!),
                        ),
                      ),
                    )));
          }),
    );
  }
}
