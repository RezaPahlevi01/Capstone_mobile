import 'package:flutter/material.dart';
import 'banksampah.dart'; // Pastikan file banksampah.dart sudah ada

class Penjualan extends StatefulWidget {
  @override
  _PenjualanState createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  final _jenisSampahController = TextEditingController();
  final _beratSampahController = TextEditingController();
  final _alamatController = TextEditingController();

  // Fungsi untuk memvalidasi dan mengarahkan ke BankSampah
  void _submitForm() {
    if (_jenisSampahController.text.isEmpty ||
        _beratSampahController.text.isEmpty ||
        _alamatController.text.isEmpty) {
      // Menampilkan alert dialog jika form kosong
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Form Tidak Lengkap'),
          content: Text('Pastikan semua field terisi dengan benar.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Jika form lengkap, navigasi ke screen selanjutnya
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BankSampah()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Bagian header dengan gambar full-width, tombol kembali, dan teks di atasnya
          Stack(
            children: [
              // Gambar header
              Container(
                width: double.infinity,
                height: 240, // Sesuaikan tinggi agar lebih proporsional dengan desain
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.jpg'), // Pastikan asset sesuai
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tombol kembali
              Positioned(
                top: 40, // Mengatur posisi tombol back lebih jelas
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Navigasi kembali
                  },
                ),
              ),
              // Teks di atas gambar
              Positioned(
                bottom: 16, // Menempatkan teks lebih di bawah gambar
                left: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6), // Overlay warna
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Penjualan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Sampah anorganik adalah jenis sampah yang berasal dari bahan-bahan yang sulit terurai oleh mikroorganisme dalam tanah atau lingkungan.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Bagian Form
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
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
                    'Form',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Field Jenis Sampah
                  TextField(
                    controller: _jenisSampahController,
                    decoration: InputDecoration(
                      labelText: 'Jenis sampah',
                      prefixIcon: Icon(Icons.delete, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Field Berat Sampah
                  TextField(
                    controller: _beratSampahController,
                    decoration: InputDecoration(
                      labelText: 'Berat sampah',
                      prefixIcon: Icon(Icons.scale, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  // Field Alamat
                  TextField(
                    controller: _alamatController,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      prefixIcon: Icon(Icons.location_on, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Spacer(),
                  // Tombol Selanjutnya
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm, // Menjalankan fungsi submit
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Penjualan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Kartu',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
