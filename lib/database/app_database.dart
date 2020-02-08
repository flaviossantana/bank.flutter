import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const int DB_VERSION = 3;

Future<Database> criarBancoDados(String tableSql) async {
  final String path = join(await getDatabasesPath(), 'bankflutter.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(tableSql);
    },
    version: DB_VERSION,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


