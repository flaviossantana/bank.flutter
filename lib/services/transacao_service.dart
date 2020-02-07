import 'package:flutter/material.dart';
import 'package:http/http.dart';

const String _PATH = 'http://192.168.56.1:8080';

class TransacaoService {
  void todas() async {
    final Response response = await get('$_PATH/transactions');
    debugPrint(response.body);
  }

  void salvar() async {
    final Response response = await post(
      '$_PATH/transactions',
      body: {'name': 'doodle', 'color': 'blue'},
    );
  }
}
