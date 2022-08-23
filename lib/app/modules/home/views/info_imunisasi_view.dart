import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InfoImunisasiView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InfoImunisasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InfoImunisasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
