import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/home/views/home_view.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Posyandu".toUpperCase(),
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.userNameController,
              decoration: InputDecoration(
                  hintText: 'Username', hintStyle: primaryTextStyle),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                  hintText: 'Password', hintStyle: primaryTextStyle),
            ),
            const SizedBox(
              height: 50,
            ),
            Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: (() {
                  if (controller.userNameController.text != '' &&
                      controller.passwordController.text != '') {
                    controller.login(controller.userNameController.text,
                        controller.passwordController.text);
                  }
                }),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Masuk",
                      style: primaryTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: semiBold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
