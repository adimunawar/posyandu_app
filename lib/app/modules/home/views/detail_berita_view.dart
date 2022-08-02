import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailBeritaView extends GetView {
  const DetailBeritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailBeritaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailBeritaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
