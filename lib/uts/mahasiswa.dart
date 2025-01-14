class Student {
  String name;
  String major;
  String email;
  String phone;
  String address;
  String imageasset;
  List<String> projects;

  Student({
    required this.name,
    required this.major,
    required this.email,
    required this.phone,
    required this.address,
    required this.imageasset,
    required this.projects,
  });
}

var studentList = [
  Student(
    name: 'Andi Pratama',
    major: 'Teknik Informatika',
    email: 'andiuhuy@gmail.com',
    phone: '081234567898',
    address: 'Kota Bandung',
    imageasset: 'assets/image/uts.png',
    projects: [
      'Sistem Informasi Manajemen',
      'Website Marketplace Kampus',
      'Aplikasi Inventori',
    ],
  ),
  Student(
    name: 'Budi Setiawan',
    major: 'Sistem Informasi',
    email: 'budbudi@gmail.com',
    phone: '089756432134',
    address: 'Kota Bogor',
    imageasset: 'assets/image/uts.png',
    projects: [
      'Pengembangan Aplikasi Mobile',
      'Sistem Keamanan Jaringan',
      'Analisis Data Bisnis',
    ],
  ),
  Student(
    name: 'Nyolski',
    major: 'Teknologi Informasi',
    email: 'nyolsky12@gmail.com',
    phone: '089242343454',
    address: 'Kabupaten Bogor',
    imageasset: 'assets/image/uts.png',
    projects: [
      'Pengembangan Aplikasi Mobile',
      'Sistem Keamanan Jaringan',
      'Analisis Data Bisnis',
    ],
  ),
  Student(
    name: 'Abdul Adudul',
    major: 'Sistem Informasi',
    email: 'Adudu@gmail.com',
    phone: '0891243454544',
    address: 'Kota Jayapura',
    imageasset: 'assets/image/uts.png',
    projects: [
      'Pengembangan Aplikasi Mobile',
      'Sistem Keamanan Jaringan',
      'Analisis Data Bisnis',
    ],
  ),
  Student(
    name: 'Aries',
    major: 'Teknik Informatika',
    email: 'aries124@gmail.com',
    phone: '08971232445',
    address: 'Jakarta Timur',
    imageasset: 'assets/image/uts.png',
    projects: [
      'Pengembangan Aplikasi Mobile',
      'Sistem Keamanan Jaringan',
      'Analisis Data Bisnis',
    ],
  ),
];
