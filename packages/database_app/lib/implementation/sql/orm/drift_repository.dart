import 'package:drift/drift.dart';
import 'package:database_app/crud/interface_crud_database.dart';
import 'app_database_drift.dart';
import 'models/table.dart';


class DriftDao<T> implements ICrudDataBase<T> {
  final AppDatabase _database;

  DriftDao(this._database);

  @override
  Future<void> insert(T item) async {
    if (item is User) {
      await _database.into(_database.users).insert(
        UsersCompanion(
          name: Value(item.name),
          email: Value(item.email),
        ),
      );
    } else {
      throw UnsupportedError('Unsupported type');
    }
  }

  @override
  Future<void> update(T item) async {
    if (item is User) {
      await _database.update(_database.users).replace(
        UsersCompanion(
          id: Value(item.id),
          name: Value(item.name),
          email: Value(item.email),
        ),
      );
    } else {
      throw UnsupportedError('Unsupported type');
    }
  }

  @override
  Future<void> delete(T item) async {
    if (item is User) {
      await _database.delete(_database.users).delete(UsersCompanion(id: Value(item.id)));
    } else {
      throw UnsupportedError('Unsupported type');
    }
  }

  @override
  Future<T?> getById(int id) async {
    if (T == User) {
      final result = await (_database.select(_database.users)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      if (result != null) {
        return User(id: result.id, name: result.name, email: result.email) as T?;
      }
    }
    return null;
  }

  @override
  Future<List<T>> getAll() async {
    if (T == User) {
      final result = await _database.select(_database.users).get();
      return result.map((row) => User(id: row.id, name: row.name, email: row.email) as T).toList();
    }
    return [];
  }
}
