import 'package:flutter/material.dart';

void main() => runApp(
      FlutterBank(),
    );

class FlutterBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
        body: TransferenciaForm(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferenciaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0,00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Incluir'),
          ),
        ],
      ),
    );
  }
}

class Transferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferências',
        ),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(331.98, 2032)),
          ItemTransferencia(Transferencia(432.54, 2032)),
          ItemTransferencia(Transferencia(323.98, 2032)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Vou adicionar algo aqui depois
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.blueGrey,
      ),
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
