import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormRegisterTimbanganView extends GetView {
  const FormRegisterTimbanganView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Register Timbangan'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormRegisterTimbanganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
