import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/widget/item_card_list_view.dart';
import 'package:flutter/material.dart';

class Contatos extends StatefulWidget {
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
      body: ListView.builder(itemBuilder: (context, index) {
        return ItemCardListView(
          title: 'Alex',
          subtitle: '1234',
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
