import 'package:dr_magz/utils.dart';

class ArtikelData {
  String image;
  String title;
  String article;
  String datetime;
  String longTitle;
  bool liked;
  UrlType urlType;

  ArtikelData({
    required this.image,
    required this.title,
    this.longTitle = "",
    required this.article,
    required this.datetime,
    required this.liked,
    required this.urlType,
  });
}

List<ArtikelData> articles = <ArtikelData>[
  ArtikelData(
    image:
        "https://www.skensadigimagzcenter.site/dr_magz/images/articles/ubaya.png",
    article:
        """DR. MAGZ merupakan salah satu perwakilan dari dua tim majalah digital SMKN 1 Pasuruan, yang mengikuti kompetisi majalah digital nasional oleh Maspion IT. Kunjungan ke Politeknik Surabaya atau yang kerap diberi sebutan Ubaya untuk menjalani pelatihan fotografi dan videografi sebagai salah satu rangkaian penilaian, sudah dilakukan tim mereka pada tanggal 1 Desember 2022.

Berbagai tips dan trik dalam fotografi maupun videografi berhasil disampaikan oleh Ibu Widya Indah Nurmalasari, yang merupakan salah satu dosen prodi perpajakan Politeknik Ubaya sekaligus seorang fotografer yang karyanya tersebar di media sosial.

Para peserta, termasuk tim DR. MAGZ diberi kesempatan untuk berkeliling Ubaya dan meliput semua kegiatan yang ada di hari itu setelah berakhirnya pelatihan fotografi. Tim DR. MAGZ sendiri kala itu, berhasil meliput sejumlah lab yang biasa digunakan untuk praktikum oleh mahasiswa dan mahasiswi politeknik Ubaya.

“Saya merasa sangat senang atas kesempatan untuk meliput sejumlah aktivitas dan ruangan yang ada di Politeknik Ubaya. Karena dengan adanya kegiatan tersebut, saya dan teman teman dapat secara langsung menerapkan beberapa ilmu yang telah disampaikan oleh Ibu Widya” Ujar salah satu anggota tim DR. MAGZ

Kunjungan ke Politenik Ubaya untuk pelatihan fotografi dan videografi, merupakan pelatihan terakhir setelah ddilaksanakannya beberapa pelatihan selama 3 hari berturut turut. Pada pelatihan terkahir tersebut juga disampaikan mengenai bagaimana tahapan penilaian majalah digital milik para peserta setelah tahapan pengumpulan majalah digital yang telah dibuat oleh para peserta.""",
    title: "DR. MAGZ ke Ubaya",
    datetime: "1 day ago",
    liked: false,
    urlType: UrlType.network,
  ),
  ArtikelData(
    image:
        "https://www.skensadigimagzcenter.site/dr_magz/images/articles/mevicone.png",
    article:
        """Berorganisasi di sekolah merupakan hal yang sudah biasa dilakukan oleh para siswa siswi. Namun sebuah komunitas suatu jurusan merupakan hal yang terdengar menarik dan tidak semua sekolah mempunyainya. Hal tersebut lain oleh SMKN 1 Pasuruan, sebuah komunitas multimedia yang didirikan pada tahun 2019 kini kian berkembang sangat pesat.

Mevicone atau yang memilki kepanjangan Media Visual Creative One, merupakan satu satunya kreatif studio yang dimilki sekolah SMK di Kota Pasuruan. Komunitas ini berisikan para siswa siswi jurusan Multimedia dan DKV SMKN 1 Pasuruan yang berminat untuk mengembangkan skill jurusannya. Dalam komunitas ini terdapat beberapa divisi yang bertugas, diantaranya divisi desain, divisi foto, divisi video, divisi marketing, dan divisi pemasaran.

Selain sebagai wadah untuk mengembangkan skill jurusan, komunitas ini juga mengajarkan untuk berwirausaha sesuai divisi yang ada. Berbagai permintaan klien berhasil dilayani oleh para siswa sisiwi yang berkecimpung di komunitas ini.

Selain siswa siswi belajar berwirausaha, tak lupa mereka juga selalu mencetak prestasi. Prestasi yang akhir akhir ini melonjak adalah presatasi di dunia film. Nama komunitas Mevicone pada masa ini, sangat tersanjung oleh para siswa siswi jurusan lain dan para guru SMKN 1 Pasuruan. Bagaimana tidak, berawal dari mulainya masa new normal para siswa siswi komunitas Mevicone mencoba untuk kembali bangkit dengan mengikuti berbagai kompetisi utamanya di bidang perfilman. Proses produksi yang panjang selalu membuahkan hasil dengan hadirnya berbagai piala yang berhasil diraih. Panggilan maju ke tengah lapangan di saat upacara bendera untuk penyerahan penghargaan oleh Bapak kepala sekolah SMKN 1 Pasuruan berulang kali dilakuakan secara bergilir oleh tim Mevicone.

“Sungguh mengharumkan prestasinya, perjuangan yang panjang selalu membuahkan hasil yang memuaskan.” Mungkin kalimat tersebut pantas diucapakan kepada tim Mevicone.""",
    title: "Mevicone Bangkit",
    datetime: "1 day ago",
    liked: false,
    urlType: UrlType.network,
  ),
  ArtikelData(
    image:
        "https://www.skensadigimagzcenter.site/dr_magz/images/articles/teater.png",
    article: """Siapa sih yang belum kenal dengan eskul ini? 

Teater Srengenge adalah salah satu ekskul yang dimiliki oleh Skensa. Ekskul ini dibina oleh Pak Rosidi.  Selain untuk mengasah kemampuan siswa-siswi Skensa, teater  Srengenge juga dapat melatih kepercayaan diri, dan melatih mental agar berani tampil di depan umum. 

Sudah banyak sekali lomba yang telah diikuti teater Srengenge, salah satunya adalah lomba offline di UNISMA Surabaya dengan tingkat SMA/SMK. Tak hanya setahun dua tahun saja, ekskul teater ini telah berjalan 16 tahun. Sungguh menakjubkan bukan? Masih bertahan hingga saat ini. Teater ini sudah punya project yang pastinya akan dinanti warga Skensa loh! Yakni mengadakan pementasan tunggal pada akhir semester 1. 

Ekskul ini mengalami peningkatan yang sangat pesat sejak 5 tahun dari awal pembentukannya. Hebat sekali untuk ekskul ini, karena mampu menggaet minat dari siswa/siswi Skensa. Sobat Skensa, lantas apalagi yang jadi alasan untuk tidak join ekskul teater ini? Dijamin kalian akan mengembangkan wawasan karakter dan profesi melalui pementasan.""",
    title: "Teater Srengenge",
    datetime: "1 day ago",
    liked: false,
    urlType: UrlType.network,
  ),
  ArtikelData(
    image:
        "https://www.skensadigimagzcenter.site/dr_magz/images/articles/pramuka.png",
    article:
        """Ektrakulikuler Pramuka merupakan salah satu kegiatan pembelajaran non akademik di SMKN 1 Pasuruan yang memiliki tujuan yaitu meningkatkan kompetensi (nilai-nilai dan keterampilan), membangun karakter kedisiplinan, kemandirian dan Kepemimpinan para peserta didik.

Kegiatan dalam Ektrakulikuler Pramuka selain mengajarkan tentang cara hidup di alam bebas,  juga tentang kreativitas, keterampilan dan sebagainya.  Seperti cara ber- organisasi,  cara berbaur dengan orang lain,  bagaimana menurunkan sifat ego yang tinggi, serta diajarkan public speaking di depan banyak orang.  Di sini juga akan mendapatkan banyak pengetahuan tentang pengetahuan umum lainnya di luar Pramuka, Karena kegiatan Pramuka itu luas. 

Dari masa ke masa ekskul Pramuka di SMKN 1 Pasuruan mengalami kemajuan dari dulu yang sekedar sanggar kecil berisi lemari kayu, papan tulis, meja dan kursi. Karena kurang mampu menampung anggota-anggota Pramuka yang semakin banyak.  Pada Akhirnya dikembangkan hingga bisa menampung banyak orang, juga sudah banyak perabotan-perabotan lainnya seperti kipas, PC, printer, alat-alat panjat dan juga alat wall climbing. 

Sanggar juga memiliki gudang yang isinya banyak  peralatan sanggar seperti perahu karet, tongkat Pramuka, tenda-tenda, lalu Pramuka sekarang juga memiliki kedai sendiri yang menjual atribut-atribut Pramuka seperti bed pramuka, buku saku Pramuka,dll agar mampu meningkatkan kas Pramuka.

Untuk perlombaan, pastinya Ekstrakulikuler Pramuka sudah banyak sekali mengikuti lomba-lomba diantaranya yaitu LKBB HANI itu dilakukan secara offline di Bangil, lomba LGU (Lomba Gudep Unggul), juga pernah mengikuti lomba GP Unisda pada tahun 2020 dan masih banyak lagi. Pramuka SMKN 1 ini juga pernah mengadakan lomba nasional yaitu lomba SSC (Skensa Scout Competition) pada tahun 2021 yang dilaksanakan secara virtual.

Tentu sudah banyak prestasi yang pernah juarai oleh ekstrakulikuler Pramuka ini, termasuk  salah satunya perlombaan tingkat nasional yaitu lomba LGU (Lomba Gudep Unggul) lomba yang sudah diikuti kedua kalinya ini memenangkan juara harapan 3 Se Jawa Timur.

Menurut salah satu anggota pramuka, sudah ada rencana untuk program kerja, yaitu tahun ini atau tahun depan itu akan ada rencana SSC yang kedua, juga mengadakan water rescue mungkin pada bulan Desember waktu penentuan bantara dan laksana. Juga untuk event yang biasanya dilakukan setiap tahun itu biasanya dilakukan pada bulan April atau lebih tepatnya pada bulan Ramadan, di pertengahan itu ada musyawarah ambalan yang di situ ada musyawarah antara seluruh anggota pramuka dan juga alumni untuk untuk pemilihan calon Pradana dan pemangku adat atau lebih tepatnya jabatan untuk selanjutnya.""",
    title: "Giat Eskul Pramuka",
    datetime: "1 day ago",
    liked: false,
    urlType: UrlType.network,
  ),
  ArtikelData(
    image:
        "https://www.skensadigimagzcenter.site/dr_magz/images/articles/harmonie.png",
    article:
        """Pemerintah Kota Pasuruan melakukan pemolesan wajah Gedung Harmonie, yang merupakan salah satu cagar budaya di Kota Pasuruan. Beberapa pembongkaran dilakukan untuk memulai wisata integrasi di Kota Pasuruan. Pertama, Pemkot Pasuruan melakukan pembongkaran pagar depan gedung yang didirikan sekitar tahun 1887 itu. Kedua, digantinya konsep trotoar. Dan ketiga, pengecatan ulang gedung dan memasang lampu dan pot-pot.

"Kalau malam kelihatan cantik bangunannya. Tidak ada lagi kesan kotor dan tidak terawat," ujar Indri salah satu pengunjung Taman Kota Pasuruan. Menurut Indri, memang seharusnya Gedung Harmonie menjadi ikon cagar budaya Kota Pasuruan, karena selama ini masih samar statusnya dimiliki sebuah yayasan pendidikan swasta. "Dari dulu saya bertanya-tanya kenapa gedung ini tiba-tiba bisa menjadi milik sekolahan itu," lanjutnya.

Pemkot Pasuruan lewat Dinas Pemuda Olahraga dan Pariwisata saat ini sedang serius menyiapkan konsep wisata integrasi yang menjadi potensi Kota Pasuruan. Kepala Bidang Pariwisata Oktavia Pujilestari mengatakan, penampilan baru wajah Gedung Harmonie itu akan diupayakan dengan rangkaian program promosi pariwisata Kota Pasuruan. “Tampilan Gedung Harmonie akan dikembalikan seperti jaman kolonial (Belanda) dulu," ujarnya.
Diharapkan warga Kota Pasuruan dapat menanamkan rasa bangga dan memiliki. Sehingga kesadaran menjaga bangunan cadar budaya itu terwujud""",
    title: "Cagar Budaya Harmoni",
    datetime: "1 day ago",
    liked: false,
    urlType: UrlType.network,
  ),
];
