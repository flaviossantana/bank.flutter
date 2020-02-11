

class Contato {
  String name;
  int accountNumber;

  Contato({this.name, this.accountNumber});

  Contato.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountNumber = json['accountNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    return data;
  }
}
