import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/topup.dart';
import 'register.dart'; 
import 'formlogin.dart';

class Login extends StatelessWidget {
  const Login({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logoLogin.png', // Ganti dengan path gambar yang sudah disiapkan
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'SIMPAS',
              style: TextStyle(
                fontFamily: 'Lemon', // Menggunakan font LEMON
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sistem Informasi Sampah',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600, // SemiBold
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman login form
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text(
                'Login User',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Navigasi ke halaman register
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanDaftar()),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20), // Tambahan jarak antar tombol
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman pengepul
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text(
                'Login Pengepul',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
