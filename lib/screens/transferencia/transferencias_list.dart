import 'package:fluterbank/models/transferencia.dart';
import 'package:fluterbank/screens/transferencia/transferencia_form.dart';
import 'package:flutter/material.dart';

const _transferencia = 'Transferências';

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
          _transferencia,
        ),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencias = widget._transferencias[index];

          return ItemTransferencia(transferencias);
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

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}
