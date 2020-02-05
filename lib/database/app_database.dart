import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void criarBancoDados() {
  getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bankflutter.db');
    openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contato( '
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'conta INTEGER )');
    }, version: 1);
  });
}
