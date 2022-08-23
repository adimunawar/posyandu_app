import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/home/views/widgets/menu_widget.dart';
import '../../../utils/constants.dart';
import '../controllers/home_controller.dart';
import 'widgets/herder_widget.dart';
import 'widgets/news_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              if (Constanta.user.role == 1)
                const SizedBox(
                  height: 16,
                ),
              const MenuWidget(),
              const SizedBox(
                height: 16,
              ),
              const NewsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
