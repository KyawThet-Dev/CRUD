// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CustomerDao? _customerDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customer` (`customerID` TEXT NOT NULL, `customerName` TEXT NOT NULL, `customerCode` TEXT NOT NULL, `customerEmail` TEXT NOT NULL, `customerPhone` TEXT NOT NULL, `customerAddress` TEXT NOT NULL, `active` TEXT NOT NULL, PRIMARY KEY (`customerID`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _customerDtoInsertionAdapter = InsertionAdapter(
            database,
            'Customer',
            (CustomerDto item) => <String, Object?>{
                  'customerID': item.customerID,
                  'customerName': item.customerName,
                  'customerCode': item.cutomerCode,
                  'customerEmail': item.cutomerEmail,
                  'customerPhone': item.customerPhone,
                  'customerAddress': item.customerAddress,
                  'active': item.active
                },
            changeListener),
        _customerDtoDeletionAdapter = DeletionAdapter(
            database,
            'Customer',
            ['customerID'],
            (CustomerDto item) => <String, Object?>{
                  'customerID': item.customerID,
                  'customerName': item.customerName,
                  'customerCode': item.cutomerCode,
                  'customerEmail': item.cutomerEmail,
                  'customerPhone': item.customerPhone,
                  'customerAddress': item.customerAddress,
                  'active': item.active
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CustomerDto> _customerDtoInsertionAdapter;

  final DeletionAdapter<CustomerDto> _customerDtoDeletionAdapter;

  @override
  Future<CustomerDto?> findLastItem() async {
    return _queryAdapter.query(
        'select * from customer where active=\"True\" order by modifiedOn desc limit 1',
        mapper: (Map<String, Object?> row) => CustomerDto(
            customerID: row['customerID'] as String,
            customerName: row['customerName'] as String,
            cutomerCode: row['customerCode'] as String,
            cutomerEmail: row['customerEmail'] as String,
            customerPhone: row['customerPhone'] as String,
            customerAddress: row['customerAddress'] as String,
            active: row['active'] as String));
  }

  @override
  Future<List<CustomerDto>> findAll() async {
    return _queryAdapter.queryList(
        'select * from customer where active=\"True\"',
        mapper: (Map<String, Object?> row) => CustomerDto(
            customerID: row['customerID'] as String,
            customerName: row['customerName'] as String,
            cutomerCode: row['customerCode'] as String,
            cutomerEmail: row['customerEmail'] as String,
            customerPhone: row['customerPhone'] as String,
            customerAddress: row['customerAddress'] as String,
            active: row['active'] as String));
  }

  @override
  Stream<List<CustomerDto>> findAllStreaCustomer() {
    return _queryAdapter.queryListStream('select * from customer',
        mapper: (Map<String, Object?> row) => CustomerDto(
            customerID: row['customerID'] as String,
            customerName: row['customerName'] as String,
            cutomerCode: row['customerCode'] as String,
            cutomerEmail: row['customerEmail'] as String,
            customerPhone: row['customerPhone'] as String,
            customerAddress: row['customerAddress'] as String,
            active: row['active'] as String),
        queryableName: 'customer',
        isView: false);
  }

  @override
  Future<CustomerDto?> findById(String customerId) async {
    return _queryAdapter.query('select * from customer where customerID=?1',
        mapper: (Map<String, Object?> row) => CustomerDto(
            customerID: row['customerID'] as String,
            customerName: row['customerName'] as String,
            cutomerCode: row['customerCode'] as String,
            cutomerEmail: row['customerEmail'] as String,
            customerPhone: row['customerPhone'] as String,
            customerAddress: row['customerAddress'] as String,
            active: row['active'] as String),
        arguments: [customerId]);
  }

  @override
  Future<void> deleteById(String customerId) async {
    await _queryAdapter.queryNoReturn(
        'delete from customer where customerID=?1',
        arguments: [customerId]);
  }

  @override
  Future<void> insertOne(CustomerDto itemGroup) async {
    await _customerDtoInsertionAdapter.insert(
        itemGroup, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertMany(List<CustomerDto> itemGroup) async {
    await _customerDtoInsertionAdapter.insertList(
        itemGroup, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteAll(List<CustomerDto> itemGroup) async {
    await _customerDtoDeletionAdapter.deleteList(itemGroup);
  }
}
