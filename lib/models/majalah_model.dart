import 'package:dr_magz/models/isi_majalah_model.dart';
import 'package:dr_magz/utils.dart';

class MajalahData {
  String image;
  String desc;
  List<MajalahIsi> majalah;
  String datetime;
  UrlType urlType;

  MajalahData({
    required this.image,
    required this.desc,
    required this.majalah,
    required this.datetime,
    required this.urlType,
  });
}

List<MajalahData> majalahs = <MajalahData>[
  MajalahData(
    image: "https://www.skensadigimagzcenter.site/dr_magz/images/poster.png",
    desc:
        "Imajinasi dunia akan segera datang, dunia virtual  oleh teknolgi digital dan dunia fisik. Representasi nyata dari internet, pengguna berinteraksi satu sama lain dengan realistis. ",
    datetime: "23 November 2022",
    majalah: isi[0],
    urlType: UrlType.network,
  ),
];
