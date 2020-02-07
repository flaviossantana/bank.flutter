import 'package:fluterbank/database/app_database.dart';
import 'package:fluterbank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

const String CL_ID = 'id';
const String CL_NOME = 'name';
const String CL_CONTA = 'accountNumber';

class ContatoDao {
  static const String TB_CONTATO = 'contato';

  static const String tbContatoSql = 'CREATE TABLE $TB_CONTATO( '
      '$CL_ID INTEGER PRIMARY KEY, '
      '$CL_NOME TEXT, '
      '$CL_CONTA INTEGER )';

  Future<int> salvar(Contato contato) async {
    return (await criarBancoDados(tbContatoSql))
        .insert(TB_CONTATO, contato.toMap());
  }

  Future<List<Contato>> todos() async {
    final Database db = await criarBancoDados(tbContatoSql);
    final List<Map<String, dynamic>> maps = await db.query(TB_CONTATO);
    final List<Contato> contatos = List();
    for (Map<String, dynamic> map in maps) {
      contatos.add(Contato.fromMap(map));
    }
    return contatos;
  }
}
