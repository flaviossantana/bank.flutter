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
        body: Transferencias(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferenciaForm extends StatelessWidget {
  final TextEditingController _numeroContaTEC = TextEditingController();
  final TextEditingController _valorTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência'),
      ),
      body: Column(
        children: <Widget>[
          TextFieldBnk(
            controlador: _numeroContaTEC,
            rotulo: 'Número da Conta:',
            dica: '0000',
          ),
          TextFieldBnk(
              controlador: _valorTEC,
              rotulo: 'Valor:',
              dica: '0,00',
              icone: Icons.monetization_on),
          RaisedButton(
            child: Text('Incluir'),
            onPressed: () => _criarTransferencia(context),
          ),
        ],
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int conta = int.tryParse(_numeroContaTEC.text);
    final double valor = double.tryParse(_valorTEC.text);

    if (isTransferenciaValida(conta, valor)) {
      final novaTransferencia = Transferencia(valor, conta);
      debugPrint('$novaTransferencia');

      Navigator.pop(context, novaTransferencia);
    }
  }

  bool isTransferenciaValida(int conta, double valor) =>
      conta != null && valor != null;
}

class TextFieldBnk extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  TextFieldBnk({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class Transferencias extends StatelessWidget {
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferências',
        ),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, index) {

          final transferencias = _transferencias[index];

          return ItemTransferencia(transferencias);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferenciaForm();
          }));

          future.then((transferencia) {
            _transferencias.add(transferencia);
          });
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, conta: $conta}';
  }
}
