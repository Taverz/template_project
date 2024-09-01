import 'package:sqflite/sqflite.dart';
import 'package:database_app/crud/interface_crud_database.dart';

// class SQLiteRepository<T> implements IRepository<T> {
class SQLiteUserDAO<T> implements ICrudDataBase<T>  {
  final Database _database;
  
  SQLiteUserDAO(this._database);

  @override
  Future<void> insert(T item) async {
    // Реализация вставки данных в SQLite
  }

  @override
  Future<void> update(T item) async {
    // Реализация обновления данных в SQLite
  }

  @override
  Future<void> delete(T item) async {
    // Реализация удаления данных из SQLite
  }

  @override
  Future<T?> getById(int id) async {
    // Реализация получения данных по ID из SQLite
    return null;
  }

  @override
  Future<List<T>> getAll() async {
    // Реализация получения всех данных из SQLite
    return [];
  }
}
