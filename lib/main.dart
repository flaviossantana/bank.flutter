import 'package:flutter/material.dart';

void main() => runApp(
      ByteBankApp(),
    );

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green[800]),
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
            Image.asset('assets/logo/bytebank_logo.png'),
            Container(
              height: 100,
              width: 200,
              color: Colors.green[900],
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contatos'),
                ],
              ),
            )
          ],
        ));
  }
}
