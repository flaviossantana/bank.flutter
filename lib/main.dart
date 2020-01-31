import 'package:fluterbank/resources/values/app_colors.dart';
import 'package:fluterbank/screens/dashboard_view.dart';
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
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}