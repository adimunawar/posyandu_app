import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/modules/balita/views/balita_view.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Menu",
            style: primaryTextStyle.copyWith(fontWeight: bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 14,
            spacing: 6.0,
            clipBehavior: Clip.antiAlias,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              ItemMenuCard(
                onTap: () {
                  Get.to(const BalitaView());
                },
                imagePath: 'assets/images/baby.png',
                title: 'Balita',
              ),
              ItemMenuCard(
                onTap: () {},
                imagePath: 'assets/images/mother_2.png',
                title: 'Ibu',
              ),
              ItemMenuCard(
                onTap: () {},
                imagePath: 'assets/images/pregnant.png',
                title: 'Ibu Hamil',
              ),
              ItemMenuCard(
                onTap: () {},
                imagePath: 'assets/images/mother.png',
                title: 'Penimbangan',
              ),
              ItemMenuCard(
                onTap: () {},
                imagePath: 'assets/images/injection.png',
                title: 'Imunisasi',
              ),
              ItemMenuCard(
                onTap: () {},
                imagePath: 'assets/images/baby-food.png',
                title: 'Gizi',
              ),
              // ItemMenuCard(
              //   onTap: () {},
              //   imagePath: 'assets/images/baby.png',
              //   title: 'Balita',
              // ),
              // ItemMenuCard(
              //   onTap: () {},
              //   imagePath: 'assets/images/mother.png',
              //   title: 'Balita',
              // ),
              // ItemMenuCard(
              //   onTap: () {},
              //   imagePath: 'assets/images/mother_2.png',
              //   title: 'Balita',
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemMenuCard extends StatelessWidget {
  final Function onTap;
  final String title;
  final String imagePath;
  const ItemMenuCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: screenWidth / 3 - 15,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                imagePath,
                height: 50,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 80,
              child: Text(
                title,
                style: primaryTextStyle,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
