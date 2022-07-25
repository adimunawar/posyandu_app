import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormBalitaView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormBalitaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FormBalitaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
