import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotifikasiView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifikasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotifikasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
