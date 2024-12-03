import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Detailpenjualan.dart'; // Import halaman Detailpenjualan
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:flutter/foundation.dart' show kIsWeb;


class BankSampah extends StatefulWidget {
  @override
  _BankSampahState createState() => _BankSampahState();
}

class _BankSampahState extends State<BankSampah> {
  int _selectedIndex = 0; // Untuk melacak tab yang aktif

  // Daftar halaman yang akan ditampilkan berdasarkan tab
  final List<Widget> _pages = [
    PenjualanPage(), // Halaman Penjualan
    ProfilePage(),    // Halaman Profit
    AboutPage(),     // Halaman Kartu
  ];

  // Fungsi untuk menangani tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Memperbarui index tab yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: _pages[_selectedIndex], // Menampilkan halaman berdasarkan pilihan tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Menunjukkan tab yang aktif
        onTap: _onItemTapped, // Menangani tap pada tab
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_outlined),
            label: 'Penjualan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Deteksi',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class PenjualanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'), // Ganti dengan path gambar Anda
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content overlay
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Penjualan',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sampah anorganik adalah jenis sampah yang berasal dari bahan-bahan yang sulit terurai oleh mikroorganisme dalam tanah atau lingkungan.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
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
                      'Pilih Bank Sampah',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    // List of Bank Sampah cards
                    ...List.generate(4, (index) => BankSampahCard()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BankSampahCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bank Sampah Dewi Shinta',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Panggung, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Jam Buka: 09.00 - 17.00',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Detail Penjualan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detailpenjualan()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Pilih'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = '';
  String _email = '';
  bool _isLoading = true;

  // ID pengguna yang sedang login
  final int userId = 1;  // Ganti dengan ID pengguna yang sedang login

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Fungsi untuk mengambil data dari API
  Future<void> _getUserData() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/getUserData?user_id=$userId'),
    );

    if (response.statusCode == 200) {
      // Jika server merespons dengan kode status 200 (OK)
      var data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        setState(() {
          _userName = data['nama'];
          _email = data['email'];
          _isLoading = false;
        });
      } else {
        // Menangani kesalahan jika data tidak ditemukan
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      // Menangani kesalahan jika API gagal
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())  // Menampilkan indikator loading
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/ucok.jpg'), // Gambar default
                  ),
                  SizedBox(height: 20),
                  Text(
                    _userName.isEmpty ? 'Nama tidak ditemukan' : _userName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _email.isEmpty ? 'Email tidak ditemukan' : _email,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  io.File? _image;
  String? _imageUrl;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          _imageUrl = pickedFile.path;
        } else {
          _image = io.File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'IMAGE CLASSIFICATION',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.lightGreen[100],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.lightGreen[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DESKRIPSI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Sampah Organik: Sampah yang dapat terurai secara alami...'
                'Sampah Anorganik: Sampah yang tidak mudah terurai...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 400.0),
                  child: kIsWeb
                      ? (_imageUrl == null
                          ? Text("No image selected.")
                          : Image.network(_imageUrl!, height: 200))
                      : (_image == null
                          ? Text("No image selected.")
                          : Image.file(_image!, height: 200)),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _pickImage,
                  child: Text("Upload Image"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
