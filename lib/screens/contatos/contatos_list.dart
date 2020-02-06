import 'package:fluterbank/database/dao/contato_dao.dart';
import 'package:fluterbank/models/contato.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/widget/item_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'contatos_form.dart';

class Contatos extends StatefulWidget {
  final ContatoDao _contatoDao = ContatoDao();
  Future<List<Contato>> _contatos;

  @override
  State<StatefulWidget> createState() {
    return _ContatosState();
  }
}

class _ContatosState extends State<Contatos> {

  @override
  void initState() {
    super.initState();
    widget._contatos = contatos();
  }

  Future<List<Contato>> contatos() async {
    return await widget._contatoDao.todos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          UIText.CONTATOS,
        ),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: widget._contatos,
        builder: (BuildContext context, AsyncSnapshot<List<Contato>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return SpinKitWave(
                color: Theme.of(context).accentColor,
                size: 50.0,
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemCount: contatos.length,
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return ItemCardListView(
                    title: contato.nome,
                    subtitle: contato.conta.toString(),
                  );
                },
              );
              break;
          }
          return Text(UIText.OPS);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ContatosForm();
              },
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
