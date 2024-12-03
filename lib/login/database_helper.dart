// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;

//   DatabaseHelper._internal();

//   static Database? _database;

//   // Mendapatkan instance database
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   // Inisialisasi database
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'app_database.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   // Membuat tabel users saat pertama kali database dibuat
//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         email TEXT,
//         password TEXT
//       )
//     ''');
//   }

//   // Fungsi untuk menyisipkan data pengguna ke dalam tabel `users`
//   Future<int> insertUser(Map<String, dynamic> user) async {
//     final db = await database;
//     return await db.insert('users', user);
//   }

//   // Contoh fungsi untuk mendapatkan user berdasarkan email dan password
//   Future<Map<String, dynamic>?> getUser(String email, String password) async {
//     final db = await database;
//     final List<Map<String, dynamic>> results = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );

//     if (results.isNotEmpty) {
//       return results.first;
//     }
//     return null;
//   }
// }
