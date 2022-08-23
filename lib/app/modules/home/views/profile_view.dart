// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/authentication/views/authentication_view.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: primaryTextStyle.copyWith(
              color: Colors.white, fontSize: 20, fontWeight: bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            ListTile(
              title: Text(
                "Nama :",
                style: primaryTextStyle.copyWith(color: Colors.grey),
              ),
              trailing: Text(
                Constanta.user.name!,
                style: primaryTextStyle,
              ),
            ),
            ListTile(
              title: Text(
                "No Hp :",
                style: primaryTextStyle.copyWith(color: Colors.grey),
              ),
              trailing: Text(
                Constanta.user.phone!,
                style: primaryTextStyle,
              ),
            ),
            ListTile(
              title: Text(
                "Alamat :",
                style: primaryTextStyle.copyWith(color: Colors.grey),
              ),
              trailing: Text(
                Constanta.user.alamat ?? "_",
                style: primaryTextStyle,
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Get.off(AuthenticationView());
                },
                child: Text("Keluar")),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
