import 'package:fluterbank/components/text_field_bnk.dart';
import 'package:fluterbank/models/transferencia.dart';
import 'package:flutter/material.dart';

var _novaTransferencia = 'Nova Transferência';
var _numeroContaRotulo = 'Número da Conta:';
var _numeroContaDica = '0000';
var _valorRotulo = 'Valor:';
var _valorDica = '0.00';
var _incluirText = 'Incluir';

class TransferenciaForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferenciaFormState();
  }
}

class TransferenciaFormState extends State<TransferenciaForm> {
  final TextEditingController _numeroContaTEC = TextEditingController();
  final TextEditingController _valorTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(_novaTransferencia),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFieldBnk(
                controlador: _numeroContaTEC,
                rotulo: _numeroContaRotulo,
                dica: _numeroContaDica,
              ),
              TextFieldBnk(
                  controlador: _valorTEC,
                  rotulo: _valorRotulo,
                  dica: _valorDica,
                  icone: Icons.monetization_on),
              RaisedButton(
                child: Text(_incluirText),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _criarTransferencia(BuildContext context) {
    final int conta = int.tryParse(_numeroContaTEC.text);
    final double valor = double.tryParse(_valorTEC.text);

    _incluir(conta, valor, context);
  }

  void _incluir(int conta, double valor, BuildContext context) {
    if (isTransferenciaValida(conta, valor)) {
      final novaTransferencia =  Transferencia(valor, conta);
      Navigator.pop(context, novaTransferencia);
    }
  }

  bool isTransferenciaValida(int conta, double valor) =>
      conta != null && valor != null;
}
