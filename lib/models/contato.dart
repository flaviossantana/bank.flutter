import 'package:fluterbank/database/app_database.dart';

class Contato {
  final int id;
  final String nome;
  final int conta;

  Contato(this.nome, this.conta, {this.id});

  Map<String, dynamic> toMap({int id}) {
    final Map<String, dynamic> contatoMap = Map();
    if (id != null) {
      contatoMap[CL_ID] = id;
    }
    contatoMap[CL_NOME] = this.nome;
    contatoMap[CL_CONTA] = this.conta;
    return contatoMap;
  }

  static Contato fromMap(Map<String, dynamic> map) {
    return Contato(
      map[CL_NOME],
      map[CL_CONTA],
      id: map[CL_ID],
    );
  }

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, conta: $conta}';
  }
}
