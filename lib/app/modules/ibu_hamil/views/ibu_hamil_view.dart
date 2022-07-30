import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/ibu_hamil/views/detail_ibu_view.dart';

import '../../../data/models/ibu_hamil.dart';
import '../controllers/ibu_hamil_controller.dart';
import 'form_ibu_hamil_view.dart';

class IbuHamilView extends GetView<IbuHamilController> {
  const IbuHamilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = IbuHamilController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Ibu Hamil'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Get.to(FormIbuHamilView(
            ibu: IbuHamil(),
          ));
        }),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<IbuHamil>>(
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
                        Get.to(DetailIbuHamilView(ibu: snapshot.data![index]));
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
