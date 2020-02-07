import 'dart:convert';

import 'package:fluterbank/models/transferencia.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'loggin_interceptor.dart';

const String _PATH = 'http://192.168.56.1:8080';

class TransacaoService {
  Client _client;

  TransacaoService() {
    this._client =
        HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  }

  Future<List<Transferencia>> todas() async {
    final Response response = await _client.get('$_PATH/transactions');

    final List<dynamic> decodeJson = jsonDecode(response.body);

    final List<Transferencia> transferencia = List();

    for (Map<String, dynamic> transferenciaMap in decodeJson) {
      transferencia.add(
        Transferencia.fromMap(transferenciaMap),
      );
    }

    return transferencia;
  }
}
