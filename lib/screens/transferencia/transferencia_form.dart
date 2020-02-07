import 'package:fluterbank/components/text_field_bnk.dart';
import 'package:fluterbank/models/transferencia.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:flutter/material.dart';

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
          title: Text(UIText.NOVA_TRANSFERENCIA),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFieldBnk(
                controlador: _numeroContaTEC,
                rotulo: UIText.NUMERO_CONTA_ROTULO,
                dica: UIText.NUMERO_CONTA_DICA,
                textInputType: TextInputType.number,
              ),
              TextFieldBnk(
                controlador: _valorTEC,
                rotulo: UIText.VALOR_ROTULO,
                dica: UIText.VALOR_DICA,
                icone: Icons.monetization_on,
                textInputType: TextInputType.number,
              ),
              RaisedButton(
                child: Text(UIText.INCLUIR_TEXT),
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
      final novoContato = Transferencia(value: valor);
      Navigator.pop(context, novoContato);
    }
  }

  bool isTransferenciaValida(int conta, double valor) =>
      conta != null && valor != null;
}
