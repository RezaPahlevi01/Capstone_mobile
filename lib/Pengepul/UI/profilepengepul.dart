import 'package:flutter/material.dart';

class Profilepengepul extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Profil', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar Profil
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'), // Tambahkan gambar profil di sini
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 20),
            
            // Username
            Text(
              'USERNAME: RETZA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Alamat
            Text(
              'ALAMAT: RANDUGUNTING',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Jenis Kelamin
            Text(
              'JENIS KELAMIN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Laki-laki',
                      groupValue: 'Laki-laki',
                      onChanged: (value) {},
                      activeColor: Colors.green,
                    ),
                    Text('Laki-laki'),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Radio(
                      value: 'Perempuan',
                      groupValue: 'Laki-laki',
                      onChanged: (value) {},
                      activeColor: Colors.green,
                    ),
                    Text('Perempuan'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            
            // Email
            Text(
              'EMAIL ADDRESS: RETZA@GMAIL.COM',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            
            // Tombol Log Out
            ElevatedButton(
              onPressed: () {
                // Logika log out bisa ditambahkan di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'LOG-OUT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1, // Menandai halaman profil sebagai aktif
      //   onTap: (int index) {
      //     if (index == 0) {
      //       Navigator.pushNamed(context, '/topup'); // Navigasi ke halaman Top Up
      //     } else if (index == 2) {
      //       Navigator.pushNamed(context, '/pesan'); // Navigasi ke halaman Pesan
      //     }
      //   },
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.account_balance_wallet),
        //     label: 'Top up',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.person),
        //     label: 'Profil',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.message),
        //     label: 'Pesan',
        //   ),
    //     // ],
    //     selectedItemColor: Colors.green,
    //   ),
    );
  }
}
