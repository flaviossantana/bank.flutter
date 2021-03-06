import 'package:fluterbank/resources/values/ui_colors.dart';
import 'package:fluterbank/screens/home/dashboard_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
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
