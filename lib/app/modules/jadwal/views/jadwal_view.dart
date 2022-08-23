import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JadwalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'JadwalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
