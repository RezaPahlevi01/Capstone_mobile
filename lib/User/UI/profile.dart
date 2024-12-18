import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = '';
  String _email = '';
  bool _isLoading = true;

  // ID pengguna yang sedang login
  final int userId = 1; // Ganti dengan ID pengguna yang sedang login

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Fungsi untuk mengambil data dari API
  Future<void> _getUserData() async {
    try {
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
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
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
          ? Center(child: CircularProgressIndicator()) // Menampilkan indikator loading
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/ucok.jpg'), // Gambar default
                    ),
                    SizedBox(height: 20),
                    Text(
                      _userName.isEmpty ? 'Nama tidak ditemukan' : _userName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _email.isEmpty ? 'Email tidak ditemukan' : _email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Menandai halaman profil sebagai aktif
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/topup'); // Navigasi ke halaman Top Up
          } else if (index == 2) {
            Navigator.pushNamed(context, '/pesan'); // Navigasi ke halaman Pesan
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Top up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Pesan',
          ),
        ],
        selectedItemColor: Colors.green,
      ),
    );
  }
}
