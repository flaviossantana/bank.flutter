import 'package:fluterbank/models/contato.dart';

class Transferencia {
  final String id;
  final double value;

  final Contato contato;

  Transferencia({this.id, this.value, this.contato});

  static Transferencia fromMap(Map<String, dynamic> transferenciaMap) {
    final Map<String, dynamic> contatoJson = transferenciaMap['contact'];

    return Transferencia(
      id: transferenciaMap['id'],
      value: transferenciaMap['value'],
      contato: Contato.fromMap(contatoJson),
    );
  }

  @override
  String toString() {
    return 'Transferencia{valor: $value, contato: $contato}';
  }
}
