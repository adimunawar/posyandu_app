import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:posyandu_app/app/data/repositories/authentication_repository.dart';
import 'package:posyandu_app/app/utils/dialog_helper.dart';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';

class AuthenticationController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final count = 0.obs;

  login(String username, String password) async {
    DialogHelper.showLoading();
    Future.delayed(const Duration(seconds: 15));
    await AuthRepository()
        .loginWithUsernamePassword(username, password)
        .then((value) {})
        .onError((error, stackTrace) {
      if (error is ServerException) {
        Get.back();
        DialogHelper.showErroDialog(description: error.message);
      } else if (error is TimeoutException) {
        Get.back();
        DialogHelper.showErroDialog(description: error.message);
      } else {
        Get.back();
        DialogHelper.showErroDialog(description: "Sistem sedang sibuk sibuk");
      }
    }).then((value) {
      Get.back();
      DialogHelper.succesDialog();
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
