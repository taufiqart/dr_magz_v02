import 'package:dr_magz/utils.dart';

enum ImgType { network, asset }

class HomeModel {
  String url;
  UrlType urlType;

  HomeModel({
    required this.url,
    required this.urlType,
  });
}

List<HomeModel> homeCarousel = <HomeModel>[
  HomeModel(
    url: "https://www.skensadigimagzcenter.site/dr_magz/images/beranda1.png",
    urlType: UrlType.network,
  ),
  HomeModel(
    url: "https://www.skensadigimagzcenter.site/dr_magz/images/beranda2.png",
    urlType: UrlType.network,
  ),
  HomeModel(
    url: "https://www.skensadigimagzcenter.site/dr_magz/images/beranda3.png",
    urlType: UrlType.network,
  ),
];
