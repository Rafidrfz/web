class University {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String imageAsset;
  List<String> imageUrls;

  University({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var universityList = [
  University(
    name: 'UNIVERSITAS BINANIAGA (UNBIN)',
    location: 'Kota Bogor',
    description:
        'Universitas Binaniaga Indonesia atau disingkat UNBIN adalah sebuah universitas yang berasal dari gabungan 3 Perguruan Tinggi dibawah naungan Yayasan Binaniaga yaitu STIE Binaniaga, STIKOM Binaniaga dan AMIK Bogor. Unbin saat ini memiliki 2 fakultas yaitu Ekonomi dan Ilmu Komputer.',
    openDays: 'Open Monday - Saturday',
    openTime: '09:00 - 17:00',
    imageAsset: 'image/unbin.jpg',
    imageUrls: [
      'assets/image/unbin/3.webp',
      'assets/image/unbin/banner_gel_3.webp',
      'assets/image/unbin/Beasiswa_2024.webp',
      'assets/image/unbin/unbin-brosur.webp',
    ],
  ),
  University(
    name: 'UNIVERSITAS PAKUAN (UNPAK)',
    location: 'Kota Bogor',
    description:
        'Universitas Pakuan (UNPAK) di Bogor adalah perguruan tinggi swasta yang didirikan pada 1980. Menyediakan program dari diploma hingga pascasarjana, UNPAK fokus pada riset,pengabdian masyarakat, dan kerja sama industri.',
    openDays: 'Monday - Friday',
    openTime: '07.00 - 19.00',
    imageAsset: 'image/unpak.png',
    imageUrls: [
      'assets/image/unpak/1.jpg',
      'assets/image/unpak/2.webp',
      'assets/image/unpak/3.webp',
      'assets/image/unpak/4.webp',
    ],
  ),
  University(
    name: 'INSTITUT PERTANIAN BOGOR (IPB)',
    location: 'Kota Bogor',
    description:
        'Institut Pertanian Bogor (IPB) adalah perguruan tinggi negeri di Bogor, Jawa Barat, yang didirikan pada tahun 1963. IPB fokus pada bidang pertanian, ilmu hayati, dan teknologi, menawarkan program sarjana dan pascasarjana. IPB berperan dalam penelitian dan pengabdian masyarakat, serta menjalin kolaborasi dengan berbagai institusi nasional dan internasional.',
    openDays: 'Monday - Sunday',
    openTime: '08.00 - 18.00',
    imageAsset: 'image/ipb.png',
    imageUrls: [
      'assets/image/ipb/a.jpeg',
      'assets/image/ipb/b.jpeg',
      'assets/image/ipb/c.jpeg',
      'assets/image/ipb/d.jpg',
    ],
  ),
  University(
    name: 'UNIVERSITAS TERBUKA (UT)',
    location: 'Kota Bogor',
    description:
        'Universitas Terbuka (UT) adalah perguruan tinggi negeri di Indonesia yang didirikan pada tahun 1984. UT menawarkan sistem pembelajaran jarak jauh, memungkinkan mahasiswa untuk belajar secara fleksibel. Universitas ini menyediakan berbagai program studi sarjana dan pascasarjana, dengan fokus pada akses pendidikan yang luas bagi masyarakat.',
    openDays: 'Monday - Sunday',
    openTime: '08.00 - 19.00',
    imageAsset: 'image/ut.png',
    imageUrls: [
      'assets/image/ut/11.webp',
      'assets/image/ut/12.webp',
      'assets/image/ut/13.webp',
      'assets/image/ut/14.webp',
    ],
  ),
  University(
    name: 'UNIVERSITAS IBN KHALDUN (UIKA)',
    location: 'Kota Bogor',
    description:
        'Universitas Ibn Khaldun (UIKA) adalah perguruan tinggi swasta yang terletak di Bogor, Jawa Barat, Indonesia. Didirikan pada tahun 1998, universitas ini menawarkan berbagai program studi di bidang ilmu sosial, hukum, ekonomi, dan pendidikan. UIKA berkomitmen untuk menyediakan pendidikan berkualitas yang mengintegrasikan nilai-nilai Islam dan mencetak lulusan yang kompeten serta berakhlak mulia. Selain itu, universitas ini juga aktif dalam penelitian dan pengabdian masyarakat.',
    openDays: 'Monday - Sunday',
    openTime: '08.00 - 17.00',
    imageAsset: 'image/uik.png',
    imageUrls: [
      'assets/image/uika/22.jpg',
      'assets/image/uika/23.jpg',
      'assets/image/uika/24.jpg',
      'assets/image/uika/25.jpg',
    ],
  ),
];
