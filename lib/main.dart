import 'package:fluterbank/models/contato.dart';
import 'package:fluterbank/resources/values/ui_colors.dart';
import 'package:fluterbank/screens/dashboard_view.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';

void main() {
  runApp(ByteBankApp());
  save(Contato('FLAVIO SANTANA', 2032)).then((id) {
    todos().then((contatos) {
      debugPrint(contatos.toString());
    });
  });
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: UIColors.PRIMARY_COLOR,
          accentColor: UIColors.ACCENT_COLOR,
          buttonTheme: ButtonThemeData(
            buttonColor: UIColors.BUTTON_COLOR,
            textTheme: ButtonTextTheme.primary,
          )),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
