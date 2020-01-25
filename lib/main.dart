import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text("100,00"),
                subtitle: Text("2032"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text("258,27"),
                subtitle: Text("2032"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text("53,60"),
                subtitle: Text("2032"),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
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
          backgroundColor: Colors.blueGrey,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ));
