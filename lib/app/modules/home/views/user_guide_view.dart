import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UserGuideView extends GetView {
  const UserGuideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserGuideView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserGuideView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
