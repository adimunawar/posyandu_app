import 'package:flutter/material.dart';
import 'package:posyandu_app/app/utils/theme/fonts_style.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Berita",
            style:
                primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NewsCardWidget(
                  url:
                      'https://www.detik.com/jatim/berita/d-6195477/menkes-hingga-shahnaz-haque-puji-kader-posyandu-banyuwangi',
                  onTap: () {},
                  title:
                      "Menkes hingga Shahnaz Haque Puji Kader Posyandu Banyuwangi",
                  imgUrl:
                      'https://akcdn.detik.net.id/community/media/visual/2022/07/23/bupati-ipuk-bersama-anak-anak-banyuwangi_169.jpeg?w=700&q=90',
                ),
                const SizedBox(
                  width: 16,
                ),
                NewsCardWidget(
                  url:
                      'https://www.detik.com/jabar/berita/d-6236686/perkuat-posisi-80-posyandu-primer-pemkab-garut-alokasikan-rp-16-m',
                  onTap: () {},
                  title: "COVID-19 Turun, Posyandu Menggeliat Lagi di Klaten",
                  imgUrl:
                      'https://akcdn.detik.net.id/community/media/visual/2021/10/25/covid-19-turun-posyandu-menggeliat-lagi-di-klaten-1_169.jpeg?w=700&q=80',
                ),
                const SizedBox(
                  width: 16,
                ),
                NewsCardWidget(
                  url:
                      'https://www.detik.com/jabar/berita/d-6236686/perkuat-posisi-80-posyandu-primer-pemkab-garut-alokasikan-rp-16-m',
                  onTap: () {},
                  title:
                      "Peran Integrasi Posyandu untuk Tingkatkan Layanan Praktis Warga Desa",
                  imgUrl:
                      'https://akcdn.detik.net.id/community/media/visual/2021/08/10/mendes-hadiri-peringatan-hari-kebangkitan-teknologi-nasional-2021-1_169.jpeg?w=700&q=90',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewsCardWidget extends StatelessWidget {
  final String url;
  final String title;
  final String imgUrl;
  final Function onTap;
  const NewsCardWidget(
      {Key? key,
      required this.url,
      required this.title,
      required this.imgUrl,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _launchUrl(imgUrl);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        height: 200,
        width: 150,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                width: 150,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: primaryTextStyle.copyWith(height: 1.5, fontSize: 13),
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }
}
