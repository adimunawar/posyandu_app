import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BuatJadwalView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuatJadwalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BuatJadwalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
