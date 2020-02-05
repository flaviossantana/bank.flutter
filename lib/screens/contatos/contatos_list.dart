import 'package:fluterbank/database/app_database.dart';
import 'package:fluterbank/models/contato.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/widget/item_card_list_view.dart';
import 'package:flutter/material.dart';

import 'contatos_form.dart';

class Contatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          UIText.CONTATOS,
        ),
      ),
      body: FutureBuilder(
        future: todos(),
        builder: (context, snapshot) {
          final List<Contato> contatos = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              final Contato contato = contatos[index];
              return ItemCardListView(
                title: contato.nome,
                subtitle: contato.conta.toString(),
              );
            },
            itemCount: contatos.length,
          );
        },
      ),
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
    if (contato != null) {
      salvar(contato);
    }
  }
}
