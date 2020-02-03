import 'package:fluterbank/components/container_bnk.dart';
import 'package:fluterbank/resources/values/app_assests.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssests.LOGO_BYTE_BNK),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ContainerDash(
                  'Contatos',
                  Icons.people,
                ),
                ContainerDash(
                  'transferências',
                  Icons.credit_card,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
