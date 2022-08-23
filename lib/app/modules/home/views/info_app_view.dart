import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InfoAppView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InfoAppView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InfoAppView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
