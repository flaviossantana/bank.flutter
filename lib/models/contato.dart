import 'package:fluterbank/database/dao/contato_dao.dart';

class Contato {
  int id;
  final String nome;
  final int conta;

  Contato(this.nome, this.conta, {this.id});

  Map<String, dynamic> toMap({int id}) {
    return {
      CL_ID: id,
      CL_NOME: this.nome,
      CL_CONTA: this.conta,
    };
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
