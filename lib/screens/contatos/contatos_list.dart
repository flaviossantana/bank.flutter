import 'package:fluterbank/database/app_database.dart';
import 'package:fluterbank/models/contato.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/widget/item_card_list_view.dart';
import 'package:flutter/material.dart';

import 'contatos_form.dart';

class Contatos extends StatefulWidget {
  final List<Contato> _contatos = List();

  @override
  State<StatefulWidget> createState() {
    return ContatosState();
  }
}

class ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          UIText.CONTATOS,
        ),
      ),
      body: ListView.builder(
          itemCount: widget._contatos.length,
          itemBuilder: (context, index) {
            final Contato contato = widget._contatos[index];
            return ItemCardListView(
              title: contato.nome,
              subtitle: contato.conta.toString(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ContatosForm();
              },
            ),
          ).then(
            (contato) => _atualizar(contato),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  void _atualizar(Contato contato) {
    setState(() {
      if (contato != null) {
        salvar(contato).then((id){
          contato.id = id;
          widget._contatos.add(contato);
        });

      }
    });
  }
}
