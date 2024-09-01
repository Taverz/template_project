import 'package:api_client/interface/crud/crud_operation_interface.dart';
import 'package:api_client/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLfliteORM implements GroupCRUDOperation {
  static final SQLfliteORM instance = SQLfliteORM._init();
  static Database? _database;

  SQLfliteORM._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_group_product_1.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product_groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        group_id INTEGER,
        FOREIGN KEY (group_id) REFERENCES product_groups (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_id INTEGER,
        quantity INTEGER,
        FOREIGN KEY (product_id) REFERENCES products (id)
      )
    ''');
  }

  @override
  Future<int> createGroup(ProductGroup productGroup) async {
    final db = await instance.database;
    return await db.insert('product_groups', productGroup.toMap());
  }

  @override
  Future<List<ProductGroup>> readAllGroup() async {
    final db = await instance.database;
    final result = await db.query('product_groups');
    return result.map((map) => ProductGroup.fromMap(map)).toList();
  }

  @override
  Future<int> updateGroup(ProductGroup productGroup) async {
    final db = await instance.database;
    return await db.update('product_groups', productGroup.toMap(),
        where: 'id = ?', whereArgs: [productGroup.id]);
  }

  @override
  Future<int> deleteGroup(int id) async {
    final db = await instance.database;
    return await db.delete('product_groups', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> createProduct(Product product) async {
    final db = await instance.database;
    return await db.insert('products', product.toMap());
  }

  @override
  Future<List<Product>> readAllProduct() async {
    final db = await instance.database;
    final result = await db.query('products');
    return result.map((map) => Product.fromMap(map)).toList();
  }

  @override
  Future<int> updateProduct(Product product) async {
    final db = await instance.database;
    return await db.update('products', product.toMap(),
        where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<int> deleteProduct(int id) async {
    final db = await instance.database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> createOrder(Order order) async {
    final db = await instance.database;
    return await db.insert('orders', order.toMap());
  }

  @override
  Future<List<Order>> readAllOrder() async {
    final db = await instance.database;
    final result = await db.query('orders');
    return result.map((map) => Order.fromMap(map)).toList();
  }

  @override
  Future<int> updateOrder(Order order) async {
    final db = await instance.database;
    return await db.update('orders', order.toMap(),
        where: 'id = ?', whereArgs: [order.id]);
  }

  @override
  Future<int> deleteOrder(int id) async {
    final db = await instance.database;
    return await db.delete('orders', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Product>> getProductsByGroup(int groupId) async {
    final db = await instance.database;
    final result =
        await db.query('products', where: 'group_id = ?', whereArgs: [groupId]);
    return result.map((map) => Product.fromMap(map)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
