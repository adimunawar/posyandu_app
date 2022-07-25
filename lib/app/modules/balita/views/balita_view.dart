import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/balita_controller.dart';

class BalitaView extends GetView<BalitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balita'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Text("Anak"),
          )
        ],
      ),
    );
  }
}
