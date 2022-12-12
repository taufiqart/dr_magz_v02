import 'package:dr_magz/utils.dart';

class StoryData {
  String title;
  String longTitle;
  String url;
  UrlType urlType;
  StoryData(
      {required this.title,
      required this.longTitle,
      required this.url,
      required this.urlType});
}

List<StoryData> stories = <StoryData>[
  StoryData(
    title: "HUT RI 77",
    longTitle: "HUT RI 77",
    url:
        "https://www.skensadigimagzcenter.site/dr_magz/images/stories/hut_ri.png",
    urlType: UrlType.network,
  ),
  StoryData(
    title: "Juara Film",
    longTitle: "Juara Film Pendek",
    url:
        "https://www.skensadigimagzcenter.site/dr_magz/images/stories/lomba_film.png",
    urlType: UrlType.network,
  ),
  StoryData(
    title: "DR. MAGZ",
    longTitle: "Tim DR. MAGZ",
    url:
        "https://www.skensadigimagzcenter.site/dr_magz/images/stories/dr_magz.png",
    urlType: UrlType.network,
  ),
  StoryData(
    title: "Tefa",
    longTitle: "Profmosi Produk",
    url:
        "https://www.skensadigimagzcenter.site/dr_magz/images/stories/tefa.png",
    urlType: UrlType.network,
  ),
  StoryData(
    title: "Mevicone",
    longTitle: "Tim Mevicone",
    url:
        "https://www.skensadigimagzcenter.site/dr_magz/images/stories/mevicone.png",
    urlType: UrlType.network,
  ),
];
