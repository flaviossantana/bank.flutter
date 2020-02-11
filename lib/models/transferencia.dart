import 'package:fluterbank/models/contato.dart';

class Transferencia {
  String id;
  double value;
  Contato contact;
  String dateTime;

  Transferencia({this.id, this.value, this.contact, this.dateTime});

  Transferencia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    contact =
        json['contact'] != null ? Contato.fromJson(json['contact']) : null;
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    data['dateTime'] = this.dateTime;
    return data;
  }

  @override
  String toString() {
    return 'Transferência: valor: ${value}, Contato : nome : ${contact.name}, conta: ${contact.accountNumber}';
  }
}
