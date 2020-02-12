import 'package:fluterbank/models/contato.dart';

const String _ID = 'id';
const String _VALUE = 'value';
const String _CONTACT = 'contact';
const String _DATE_TIME = 'dateTime';

class Transferencia {
  String id;
  double value;
  Contato contact;
  String dateTime;

  Transferencia({
    this.id,
    this.value,
    this.contact,
    this.dateTime,
  });

  Transferencia.fromJson(Map<String, dynamic> json) {
    id = json[_ID];
    value = json[_VALUE];
    dateTime = json[_DATE_TIME];
    contact = json[_CONTACT] != null ? Contato.fromJson(json[_CONTACT]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[_ID] = this.id;
    data[_VALUE] = this.value;
    data[_DATE_TIME] = this.dateTime;
    if (this.contact != null) {
      data[_CONTACT] = this.contact.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Transferência: valor: ${value}, Contato : nome : ${contact.name}, conta: ${contact.accountNumber}';
  }
}
