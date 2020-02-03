import 'package:fluterbank/resources/values/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerDash extends StatelessWidget {
  final String titulo;
  final IconData icone;

  ContainerDash(this.titulo, this.icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 100,
        width: 150,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icone,
              color: Colors.white,
              size: 24.0,
            ),
            Text(
              titulo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
