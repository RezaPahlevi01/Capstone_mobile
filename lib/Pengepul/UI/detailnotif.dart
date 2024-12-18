import 'package:flutter/material.dart';

class Detailnotif extends StatefulWidget {
  @override
  _DetailnotifState createState() => _DetailnotifState();
}

class _DetailnotifState extends State<Detailnotif> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Implement navigasi sesuai kebutuhan Anda
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
              'assets/background.jpg', // Pastikan gambar ini terdaftar di pubspec.yaml
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header atas dengan gambar
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context); // Tombol kembali
                            },
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Notifikasi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Notifikasi pesanan dari penjual: Menginformasikan "
                        "kepada pengepul bahwa terdapat sampah di tempat penjual.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Body bagian bawah
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Notifikasi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Detail informasi notifikasi
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Nama',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Text('Depa'),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: const [
                                    Text(
                                      'Alamat',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Flexible(
                                      child: Text(
                                        'Panggung, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: const [
                                    Text(
                                      'Jenis sampah',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Text('Botol plastik'),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: const [
                                    Text(
                                      'Berat sampah',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Text('5 kg'),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Aksi tombol "Ambil"
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 12),
                                    ),
                                    child: const Text(
                                      'Ambil',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
          bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
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

