import 'package:fluterbank/models/transferencia.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/screens/transferencia/transferencia_form.dart';
import 'package:fluterbank/services/transacao_service.dart';
import 'package:fluterbank/widget/centered_message.dart';
import 'package:fluterbank/widget/item_card_list_view.dart';
import 'package:fluterbank/widget/loading_bnk.dart';
import 'package:flutter/material.dart';

class Transferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return TransferenciasState();
  }
}

class TransferenciasState extends State<Transferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            UIText.TRANSFERENCIAS,
          ),
        ),
        body: FutureBuilder<List<Transferencia>>(
          initialData: List(),
          future: TransacaoService().todas(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Loading.wave(context);
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:

                if (snapshot.hasData) {
                  List<Transferencia> transferecias = snapshot.data;

                  if (transferecias.isNotEmpty) {
                    return ListView.builder(

                      itemCount: transferecias.length,
                      itemBuilder: (context, index) {
                        final transferencia = transferecias[index];

                        return ItemCardListView(
                          leading: Icons.monetization_on,
                          title: transferencia.contact.name,
                          subtitle:
                              transferencia.contact.accountNumber.toString(),
                        );
                      },
                    );
                  }
                }

                return CenteredMessage(
                  UIText.TRANSACAO_NAO_ENCONTRADA,
                  icon: Icons.warning,
                );

                break;
            }

            return CenteredMessage(
              UIText.OPS,
              icon: Icons.sentiment_dissatisfied,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TransferenciaForm();
                },
              ),
            ).then(
              (transferencia) => _atualizar(transferencia),
            );
          },
          child: Icon(
            Icons.add,
          ),
        ));
  }

  void _atualizar(Transferencia transferencia) {
    setState(() {
      if (transferencia != null) {
        widget._transferencias.add(transferencia);
      }
    });
  }
}
