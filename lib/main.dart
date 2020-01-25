import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Transferências',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Vou adicionar algo aqui depois
          },
          child: Icon(
            Icons.attach_money,
          ),
          backgroundColor: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ));
