import 'package:fluterbank/components/container_bnk.dart';
import 'package:fluterbank/resources/values/app_assests.dart';
import 'package:fluterbank/resources/values/app_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      ByteBankApp(),
    );

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.PRIMARY_COLOR,
      ),
      title: 'Título',
      home: MyStatelessWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
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
        ));
  }
}
