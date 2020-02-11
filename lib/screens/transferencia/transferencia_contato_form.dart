import 'package:fluterbank/models/contato.dart';
import 'package:fluterbank/models/transferencia.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/services/transacao_service.dart';
import 'package:flutter/material.dart';

class TransferenciaContatoForm extends StatefulWidget {
  final Contato contato;

  TransferenciaContatoForm(this.contato);

  @override
  _TransferenciaContatoFormState createState() =>
      _TransferenciaContatoFormState();
}

class _TransferenciaContatoFormState extends State<TransferenciaContatoForm> {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.NOVA_TRANSFERENCIA),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contato.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contato.accountNumber.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Value'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('Transfer'),
                    onPressed: () {
                      final double value =
                          double.tryParse(_valueController.text);

                      final transactionCreated = Transferencia(
                        value: value,
                        contact: widget.contato,
                      );

                      TransacaoService()
                          .salvar(transactionCreated)
                          .then((transacao) {
                        if (transacao != null) {
                          Navigator.pop(context);
                        }
                      });

                      ;
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
