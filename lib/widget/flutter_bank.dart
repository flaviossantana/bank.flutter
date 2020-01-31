import 'package:fluterbank/screens/transferencia/transferencias_list.dart';
import 'package:flutter/material.dart';

class FlutterBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        brightness: Brightness.light,
        primaryColor: Colors.blue[700],
        accentColor: Colors.yellow[500],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.yellow[500],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Transferencias(),
      debugShowCheckedModeBanner: false,
    );
  }
}