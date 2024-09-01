import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Импортируйте файлы сгенерированные drift
part 'database.g.dart';

// Определение базы данных
@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  // Указываем версию базы данных
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Пример: метод для вставки пользователя
  Future<int> insertUser(UsersCompanion user) => into(users).insert(user);

  // Пример: метод для получения всех пользователей
  Future<List<User>> getAllUsers() => select(users).get();
}

// Функция для открытия подключения к базе данных
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(
      file,
      logStatements: true, // Включение стандартного логирования SQL-запросов
      logInfo: DriftLogger(), // Использование кастомного DriftLogger
    );
  });
}

// // Переопределение логирования в Drift
// class DriftLogger extends QueryExecutorUser {
//   @override
//   void log(LogType type, String message) {
//     // Использование пакета logger для логирования
//     logger.i(message);
//   }
// }

// import 'package:drift/drift.dart';
// import 'package:logger/logger.dart';

// // Инициализация логгера
// final logger = Logger();

// class DriftLogger extends QueryExecutorUser {
//   @override
//   void log(LogType type, String message) {
//     switch (type) {
//       case LogType.error:
//         logger.e(message);
//         break;
//       case LogType.warning:
//         logger.w(message);
//         break;
//       case LogType.info:
//       case LogType.query:
//         logger.i(message);
//         break;
//     }
//   }
// }
