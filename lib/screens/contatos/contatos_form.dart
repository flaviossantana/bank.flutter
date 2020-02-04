import 'package:fluterbank/components/text_field_bnk.dart';
import 'package:fluterbank/models/contato.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:flutter/material.dart';

class ContatosForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContatosFormState();
  }
}

class ContatosFormState extends State<ContatosForm> {
  final TextEditingController _nomeTEC = TextEditingController();
  final TextEditingController _contaTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.NOVO_CONTATO),
      ),
      body: Column(
        children: <Widget>[
          TextFieldBnk(
            rotulo: UIText.NOME_COMPLETO,
            textInputType: TextInputType.text,
            controlador: _nomeTEC,
          ),
          TextFieldBnk(
            rotulo: UIText.NUMERO_CONTA_ROTULO,
            textInputType: TextInputType.number,
            controlador: _contaTEC,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                elevation: 8.0,
                child: Text(UIText.INCLUIR_TEXT),
                onPressed: () => _criarContato(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _criarContato(BuildContext context) {
    final int conta = int.tryParse(_contaTEC.text);
    final String nome = _nomeTEC.text;

    _incluir(conta, nome, context);
  }

  void _incluir(int conta, String nome, BuildContext context) {
    if (isContatoValido(conta, nome)) {
      final novaTransferencia = Contato(nome, conta);
      Navigator.pop(context, novaTransferencia);
    }
  }

  bool isContatoValido(int conta, String nome) => conta != null && nome != null;
}
