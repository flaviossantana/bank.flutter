
const String _NAME = 'name';
const String _ACCOUNT_NUMBER = 'accountNumber';

class Contato {
  String name;
  int accountNumber;

  Contato({this.name, this.accountNumber});

  Contato.fromJson(Map<String, dynamic> json) {
    name = json[_NAME];
    accountNumber = json[_ACCOUNT_NUMBER];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[_NAME] = this.name;
    data[_ACCOUNT_NUMBER] = this.accountNumber;
    return data;
  }
}
