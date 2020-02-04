import 'package:fluterbank/components/text_field_bnk.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:flutter/material.dart';

class ContatosForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContatosFormState();
  }
}

class ContatosFormState extends StatefulWidget {
  @override
  _ContatosFormStateState createState() => _ContatosFormStateState();
}

class _ContatosFormStateState extends State<ContatosFormState> {
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
          ),
          TextFieldBnk(
            rotulo: UIText.NUMERO_CONTA_ROTULO,
            textInputType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                elevation: 8.0,
                child: Text(UIText.INCLUIR_TEXT),
                onPressed: () => (context) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
