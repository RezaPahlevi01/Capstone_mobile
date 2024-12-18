import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/User/UI/landingpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormLogin extends StatelessWidget {
  FormLogin({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi validasi email
  bool validateEmail(String email) {
    return email.isNotEmpty &&
        email.contains('@') &&
        email.endsWith('@gmail.com');
  }

  bool validatePassword(String password) {
    return password.length >= 6;
  }

  void _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (!validateEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email tidak valid. Gunakan email @gmail.com')),
      );
      return;
    }

    if (!validatePassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password harus memiliki minimal 6 karakter')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['message'] == 'Login berhasil') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Login gagal')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login gagal, periksa email dan password')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal terhubung ke server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),

              // Header Welcome Back
              const Text(
                'Welcome Back,',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              const SizedBox(height: 20),

              // Gambar
              Image.asset(
                'assets/logoLogin.png',
                height: 150,
              ),

              const SizedBox(height: 30),

              // Input Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Colors.green),
                  labelText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.green),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility, color: Colors.green),
                    onPressed: () {
                      // Tambahkan logika untuk toggle visibilitas password
                    },
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Forgot Password clicked!')),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tombol Login
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Google Login
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Google login clicked!')),
                  );
                },
                child: Image.asset(
                  'assets/logoGoogle.png',
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
