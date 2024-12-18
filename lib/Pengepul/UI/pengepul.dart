import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/Pengepul/UI/detailnotif.dart';
import 'package:flutter_application_coba_capsten/Pengepul/UI/notifikasi.dart';
import 'package:flutter_application_coba_capsten/Pengepul/UI/profilepengepul.dart';
import 'package:flutter_application_coba_capsten/Pengepul/UI/topup.dart';
import '../../User/UI/profile.dart'; // Import halaman profil
import 'notifikasi.dart';


class Pengepul extends StatefulWidget {
  @override
  _PengepulState createState() => _PengepulState();
}

class _PengepulState extends State<Pengepul> {
  int _selectedIndex = 0; // Indeks awal untuk BottomNavigationBar

  // Daftar halaman yang ditampilkan di IndexedStack
  final List<Widget> _pages = [
    TopUpPage(), // Halaman Top Up
    NotificationPage(), // Halaman Notifikasi
    Profilepengepul(), // Halaman Profil
  ];

  // Fungsi untuk menangani klik di BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Perbarui indeks terpilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menggunakan IndexedStack untuk menampilkan halaman sesuai indeks
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Indeks halaman yang aktif
        onTap: _onItemTapped, // Panggil fungsi saat item dipilih
        selectedItemColor: Colors.green, // Warna ikon aktif
        unselectedItemColor: Colors.grey, // Warna ikon tidak aktif
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Top up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Ganti dengan gambar latar belakang Anda
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Margin atas untuk status bar
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        // Aksi tombol kembali
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Top up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // Konten
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Silahkan pilih",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Opsi Top Up
                    buildTopUpOption(context, "5 point", "Rp 15.000,00"),
                    buildTopUpOption(context, "10 point", "Rp 30.000,00"),
                    buildTopUpOption(context, "15 point", "Rp 45.000,00"),
                    buildTopUpOption(context, "20 point", "Rp 60.000,00"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTopUpOption(BuildContext context, String points, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    points,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman berikutnya
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  "Pilih",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//kelas notifikasi 
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Navigasi antar halaman
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Pengepul()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Profilepengepul()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Ganti dengan gambar background Anda
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Margin atas untuk status bar
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Aksi tombol kembali
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Notifikasi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Notifikasi pesanan dari penjual menginformasikan kepada pengelol bahwa terdapat sampah di tempat penjual.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              Spacer(),
              // Konten notifikasi
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notifikasi",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4, // Jumlah notifikasi
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 6,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dapa",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors.green, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              "Panggung, Kec. Tegal Timur, Kota Tegal,\nJawa Tengah",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Navigasi ke halaman Detail tanpa mengirimkan data
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Detailnotif(),  // Navigasi ke DetailPage
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        "Detail",
                                        style: TextStyle(color: Colors.white),
                                        ),
                                     ),
                                   )
                                  ]
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
   );
  }
}



