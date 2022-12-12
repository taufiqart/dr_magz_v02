import 'package:dr_magz/utils.dart';

class FeedModel {
  String thumbnail;
  String video;
  String? link;
  String title;
  UrlType urlTypeThumb;
  UrlType urlTypeVideo;

  FeedModel(
      {required this.thumbnail,
      required this.video,
      this.link,
      required this.title,
      required this.urlTypeThumb,
      required this.urlTypeVideo});
}

List<FeedModel> feedModel = [
  FeedModel(
    thumbnail:
        "https://www.skensadigimagzcenter.site/dr_magz/images/thumbnail_ubaya.png",
    video:
        "https://www.skensadigimagzcenter.site/dr_magz/video/ubaya%20fix.mp4",
    title: "Video dokumenter Ubaya karya tim DR. Magz",
    urlTypeThumb: UrlType.network,
    urlTypeVideo: UrlType.network,
  ),
  FeedModel(
    thumbnail:
        "https://www.skensadigimagzcenter.site/dr_magz/images/thumbnail_nawasena.png",
    video:
        "https://www.skensadigimagzcenter.site/dr_magz/video/nawasena%20fix.mp4",
    title: "Film Pendek “Nawasena” karya SMKN 1 Pasuran",
    link: "https://youtu.be/fDmqtBH0Rgs",
    urlTypeThumb: UrlType.network,
    urlTypeVideo: UrlType.network,
  ),
  FeedModel(
    thumbnail:
        "https://www.skensadigimagzcenter.site/dr_magz/images/thumbnail_ikhtiar.png",
    video: "https://www.skensadigimagzcenter.site/dr_magz/video/ikhtiarku.mp4",
    title: "Film pendek “ikhtiarku” karya SMKN 1 Pasuruan",
    link: "https://youtu.be/8x8kJf30KBg",
    urlTypeThumb: UrlType.network,
    urlTypeVideo: UrlType.network,
  ),
];
