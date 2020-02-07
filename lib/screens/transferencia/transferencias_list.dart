import 'package:fluterbank/models/transferencia.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/screens/transferencia/transferencia_form.dart';
import 'package:fluterbank/widget/item_card_list_view.dart';
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
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencias[index];

          return ItemCardListView(
            leading: Icons.monetization_on,
            title: transferencia.value.toString(),
            subtitle: 'Subtítulo',
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
      ),
    );
  }

  void _atualizar(Transferencia transferencia) {
    setState(() {
      if (transferencia != null) {
        widget._transferencias.add(transferencia);
      }
    });
  }
}
