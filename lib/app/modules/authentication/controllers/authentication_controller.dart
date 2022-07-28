import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/data/repositories/authentication_repository.dart';
import 'package:posyandu_app/app/modules/home/views/home_view.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/error_hendler.dart';
import 'package:posyandu_app/app/utils/helpers/dialog_helper.dart';

class AuthenticationController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final count = 0.obs;

  void login(String username, String password) async {
    DialogHelper.showLoading();
    Future.delayed(const Duration(seconds: 15));
    await AuthRepository()
        .loginWithUsernamePassword(username, password)
        .then((user) {
      Constanta.userId = user.id!;
      Constanta.user = user;
      Get.back();
      Get.off(const HomeView());
      // DialogHelper.succesDialog();
    }).onError((error, stackTrace) {
      handleError(error);
    });
  }
}
