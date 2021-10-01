import 'package:dro_health_task/repositories/database_items.dart';
import 'package:dro_health_task/shared/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabase{
  // we want to persist some items in the cart
  static final CartDatabase instance = CartDatabase._init();
  static Database? _database;
  CartDatabase._init();

  //open database
  Future<Database> get database async {
    if(_database != null ) return _database!;

    _database = await _initDB("carts.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version:  1, onCreate: _createDB); // db schema
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $databaseItemsTable (
    ${DatabaseItemFields.id} $idType,
    ${DatabaseItemFields.imageUrl} $textType,
    ${DatabaseItemFields.productName} $textType,
    ${DatabaseItemFields.productPrice} $integerType,
    ${DatabaseItemFields.quantity} $integerType,
    ${DatabaseItemFields.productType} $textType,
    ${DatabaseItemFields.productMg} $integerType)''');
  }

  Future<DatabaseItems> create(DatabaseItems databaseItems) async {
    SharedPreferences? preferences;
    final db = await instance.database;
    int? id;
    final orderBy = '${DatabaseItemFields.id} ASC';
    List<Map<String, dynamic>> result = await db.query(databaseItemsTable, orderBy: orderBy);
    print(result);
    for(int index =0; index < result.length; index++) {
      print(index);
      print((result[index]["productName"]).toString());
      preferences = await SharedPreferences.getInstance();
      preferences.setString("productName", result[index]['productName']);
      print(preferences.getString("productName"));
      if ((result[index]["productName"]).toString().contains(databaseItems.productName)) {
        preferences.setString('response', "${databaseItems.productName} has already been added to cart");
        print('item already in cart');
        break;
      }
    }
    if(preferences?.getString("productName") != databaseItems.productName){
      id = await db.insert(databaseItemsTable, databaseItems.toJson());
      preferences?.setString('response', "${databaseItems.productName} has been successfully added to cart");
      print('item added to cart');
      print(databaseItems.toJson());
      print(databaseItems.productName);
    }

    return databaseItems.copy(id: id);
  }

  Future<DatabaseItems> readItems(int id) async {
    final db = await instance.database;

    final maps = await db.query( databaseItemsTable,
      columns:  DatabaseItemFields.values,
      where: '${DatabaseItemFields.id} = ? ',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return DatabaseItems.fromJson(maps.first);
    }
    else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<DatabaseItems>> readAllItems() async {
    final db = await instance.database;
    final orderBy = '${DatabaseItemFields.id} ASC';
    final result = await db.query(databaseItemsTable, orderBy: orderBy);
    return result.map((json) => DatabaseItems.fromJson(json)).toList();
  }

  Future<int> update(DatabaseItems databaseItems) async {
    final db = await instance.database;

    return db.update(databaseItemsTable,
      databaseItems.toJson(),
      where: '${DatabaseItemFields.id} = ?',
      whereArgs: [databaseItems.id],
    );
  }
  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(databaseItemsTable,
      where: '${DatabaseItemFields.id} = ?',
      whereArgs: [id],
    );
  }
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}