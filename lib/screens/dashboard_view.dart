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
      body: ListView(
        children: <Widget>[
          Image.asset(AppAssests.LOGO_BYTE_BNK),
          ContainerDash('Contatos', Icons.people),
          ContainerDash('transferências', Icons.credit_card),
        ],
      ),
    );
  }
}