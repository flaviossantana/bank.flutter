import 'package:fluterbank/components/container_bnk.dart';
import 'package:fluterbank/resources/values/ui_assests.dart';
import 'package:fluterbank/resources/values/ui_text.dart';
import 'package:fluterbank/screens/transferencia/transferencias_list.dart';
import 'package:flutter/material.dart';

import 'contatos/contatos_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.DASHBOARD),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(UIAssest.LOGO_BYTE_BNK),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ContainerDash(
                    UIText.CONTATOS,
                    Icons.people,
                    onTap: () {
                      _navigationPush(context, Contatos());
                    },
                  ),
                  ContainerDash(
                    UIText.TRANSFERENCIAS,
                    Icons.credit_card,
                    onTap: () {
                      _navigationPush(context, Transferencias());
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _navigationPush(BuildContext context, view) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }
}
