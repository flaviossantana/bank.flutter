import 'package:fluterbank/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const int DB_VERSION = 1;
const String TB_CONTATO = 'contato';
const String CL_ID = 'id';
const String CL_NOME = 'nome';
const String CL_CONTA = 'conta';

Future<Database> criarBancoDados() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bankflutter.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE $TB_CONTATO( '
          '$CL_ID INTEGER PRIMARY KEY, '
          '$CL_NOME TEXT, '
          '$CL_CONTA INTEGER )');
    }, version: DB_VERSION);
  });
}

Future<int> save(Contato contato) {
  return criarBancoDados().then((db) {
    return db.insert(TB_CONTATO, contato.toMap());
  });
}

Future<List<Contato>> todos() {
  return criarBancoDados().then((db) {
    return db.query(TB_CONTATO).then((maps) {
      final List<Contato> contatos = List();
      for (Map<String, dynamic> map in maps) {
        contatos.add(Contato.fromMap(map));
      }
      return contatos;
    });
  });
}
