
import 'dart:developer';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService{
  //singleton
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();
  //

  //the database must be initialized before creating any tables or performing read/write operations
  static Database? _database;
  Future<Database> get database async {
    if (_database != null){
      return _database!;
    }

    await initDatabase();
    return _database!;
  }

  //we check if the database is present, if not, we create it using initDatabase() function
  Future<void> initDatabase() async {
    try {
      final getDirectory = await getApplicationDocumentsDirectory();
      String path = join(getDirectory.path, 'db_clothes.db');

      // await deleteDatabase(path);
      
      _database = await openDatabase(
        path,
        version: 2,
        onCreate: _onCreate,
        onOpen: (db) {
          log('Database opened');
        },
      );
      log('Database initialized');
      // return _database!;
    } catch (e) {
      log('Error initializing database: $e');
      rethrow;
    }
  }

  //creates the database using  _onCreate() function
  void _onCreate(Database db, int version) async {
    try {
      //Address
      await db.execute(
        'CREATE TABLE IF NOT EXISTS Address (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, phone TEXT);',
      );
      log('TABLE CREATED: Address');

      //Bill
      await db.execute(
        'CREATE TABLE IF NOT EXISTS Bill (id TEXT PRIMARY KEY, status TEXT, userId TEXT, date TEXT, amount_cart TEXT, cart_img TEXT);',
      );
      log('TABLE CREATED: Bill');

      //Bill cart
      await db.execute(
        'CREATE TABLE IF NOT EXISTS BillCart (bill_id TEXT, cart_id TEXT, cart_price TEXT);',
      );
      log('TABLE CREATED: BillCart');

      //Liked
      await db.execute(
        'CREATE TABLE IF NOT EXISTS Liked (product_id TEXT);',
      );
      log('TABLE CREATED: Liked');

    } catch (e) {
      log('Error creating tables: $e');
      rethrow;
    }
  }
  //
}