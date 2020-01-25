import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey,
        ),
        home: Scaffold(
          body: Transferencias(),
          appBar: AppBar(
            title: const Text(
              'Transferências',
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Vou adicionar algo aqui depois
            },
            child: Icon(
              Icons.attach_money,
            ),
            backgroundColor: Colors.blueGrey,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

class Transferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(331.98, 2032)),
        ItemTransferencia(Transferencia(432.54, 2032)),
        ItemTransferencia(Transferencia(766.98, 2032)),
      ],
    );
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

class Transferencia {
  final double valor;
  final int conta;

  Transferencia(this.valor, this.conta);
}
