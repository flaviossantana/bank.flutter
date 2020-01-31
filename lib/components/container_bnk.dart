import 'package:fluterbank/resources/values/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerDash extends StatelessWidget {

  final String titulo;
  final IconData icone;

  ContainerDash(this.titulo, this.icone);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: AppColors.PRIMARY_COLOR,
      child: Column(
        children: <Widget>[
          Icon(icone),
          Text(titulo),
        ],
      ),
    );
  }
}
