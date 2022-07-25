import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailBalitaView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailBalitaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailBalitaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
