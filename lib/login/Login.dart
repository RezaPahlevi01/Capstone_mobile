import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'register.dart'; 
import 'formlogin.dart'; // Pastikan FormLogin diimpor

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
              'assets/logoAwal.png', // Ganti dengan path gambar yang sudah disiapkan
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
                'Log In',
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
          ],
        ),
      ),
    );
  }
}
