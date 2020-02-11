import 'package:fluterbank/resources/values/ui_colors.dart';
import 'package:fluterbank/screens/home/dashboard_view.dart';
import 'package:fluterbank/services/transacao_service.dart';
import 'package:flutter/material.dart';

import 'models/contato.dart';
import 'models/transferencia.dart';

void main() {
  runApp(ByteBankApp());
  TransacaoService().salvar(Transferencia(
    value: 2345.65,
    contact: Contato(
      name: 'ANDREA EUGÊNIA',
      accountNumber: 3244,
    ),
  )).then((transacao){
    print(transacao);
  });
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: UIColors.PRIMARY_COLOR,
          accentColor: UIColors.ACCENT_COLOR,
          buttonTheme: ButtonThemeData(
            buttonColor: UIColors.BUTTON_COLOR,
            textTheme: ButtonTextTheme.primary,
          )),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Dashboard(),
      ),
    );
  }
}
