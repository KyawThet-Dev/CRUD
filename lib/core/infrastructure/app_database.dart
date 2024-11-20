import 'dart:async';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import '../../customer/infrastructure/models/customer_dto.dart';
import '../../customer/infrastructure/services/dao/customer_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  CustomerDto,
])
abstract class AppDatabase extends FloorDatabase {
  CustomerDao get customerDao;
}

class AppFloorDB {
  static const String tag = 'AppFloorDB';

  late AppDatabase _instance;
  AppDatabase get instance => _instance;

  bool _hasBeenInitialized = false;

  Future<void> init() async {
    if (_hasBeenInitialized) return;
    _hasBeenInitialized = true;

    _instance = await $FloorAppDatabase
        .databaseBuilder('super_pos.db')
        .addMigrations([]).build();
  }
}
