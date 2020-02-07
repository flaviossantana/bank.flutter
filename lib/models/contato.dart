import 'package:fluterbank/database/dao/contato_dao.dart';

class Contato {
  int id;
  final String name;
  final int accountNumber;

  Contato(this.name, this.accountNumber, {this.id});

  Map<String, dynamic> toMap({int id}) {
    return {
      CL_ID: id,
      CL_NOME: this.name,
      CL_CONTA: this.accountNumber,
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
    return 'Contato{id: $id, nome: $name, conta: $accountNumber}';
  }
}
