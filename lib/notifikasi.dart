import 'package:flutter/material.dart';
import 'pengepul.dart';
import 'profile.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedIndex = 2; // Default index for Notification screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding screen based on the selected index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Pengepul()), // Replace with actual screen for "Top up"
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with actual screen for "Profil"
        );
        break;
      case 2:
        // Already on Notification screen
        break;
    }
  }

  void _navigateToDetail(String user, String jenisSampah, String berat, String alamat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationDetailScreen(
          user: user,
          jenisSampah: jenisSampah,
          berat: berat,
          alamat: alamat,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Notifikasi', style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text('User1 ingin meloloskan barang'),
            subtitle: Text('2 menit yang lalu'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _navigateToDetail("User1", "Plastik", "2 kg", "Jl. Melati No. 123");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text('dava ingin menjual sampah'),
            subtitle: Text('5 menit yang lalu'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _navigateToDetail("dava", "Kertas", "5kg", "Jl.pancasila No. 10");
            },
          ),
          // Tambahkan item notifikasi lain di sini
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            icon: Icon(Icons.notification_add),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}

class NotificationDetailScreen extends StatelessWidget {
  final String user;
  final String jenisSampah;
  final String berat;
  final String alamat;

  NotificationDetailScreen({
    required this.user,
    required this.jenisSampah,
    required this.berat,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Notifikasi'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User: $user", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text("Jenis Sampah: $jenisSampah", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8.0),
            Text("Berat: $berat", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8.0),
            Text("Alamat: $alamat", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
