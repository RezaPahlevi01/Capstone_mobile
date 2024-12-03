import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/notifikasi.dart';
import 'package:flutter_application_coba_capsten/pengepul.dart';
import 'package:flutter_application_coba_capsten/profilepengepul.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  int _selectedIndex = 0;

  final List <Widget> _pages=[
    Pengepul(),
    NotificationPage(),
    Profilepengepul(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Navigasi antar halaman
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OrderDetailPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/background.jpg', // Ganti dengan gambar latar belakang Anda
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Column(
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
                  SizedBox(height: 20),
                  // Konten Pesanan
                  Container(
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
                          "Pesanan anda",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nama", style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("agus anjay"),
                              SizedBox(height: 16),
                              Text("5 point", style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("Rp 15.000"),
                              SizedBox(height: 16),
                              Text("Nomor Rekening", style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("123xxxxxxx"),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Bukti Transfer", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Aksi tombol input
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      "Input",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Petunjuk pembayaran
                        Text(
                          "Petunjuk pembayaran",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "1. Buka e-wallet atau mobile banking anda.\n"
                          "2. Transfer ke nomor rekening yang tertera dengan nominal Rp 15.000.\n"
                          "3. Setelah pembayaran berhasil, tangkap layar (screenshot) sebagai bukti pembayaran dan masukkan foto tangkap layar tersebut pada Bukti Transfer.",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(height: 20),
                        // Tombol Pesan
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Aksi tombol pesan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              "Pesan",
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
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
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


