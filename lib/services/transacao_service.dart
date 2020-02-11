import 'dart:convert';

import 'package:fluterbank/models/transferencia.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'loggin_interceptor.dart';

const String _PATH = 'http://192.168.56.1:8080';
const String _URL_TRANSACAO = '$_PATH/transactions';

class TransacaoService {
  Client _client;

  TransacaoService() {
    this._client =
        HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  }

  Future<List<Transferencia>> todas() async {
    final Response response =
        await _client.get(_URL_TRANSACAO).timeout(Duration(seconds: 5));

    final List<dynamic> decodeJson = jsonDecode(response.body);

    final List<Transferencia> transferencia = List();

    for (Map<String, dynamic> transferenciaMap in decodeJson) {
      transferencia.add(
        Transferencia.fromJson(transferenciaMap),
      );
    }

    return transferencia;
  }

  Future<Transferencia> salvar(Transferencia transferencia) async {
    final Map<String, dynamic> transacaoMap = transferencia.toJson();
    final String transacaoJson = jsonEncode(transacaoMap);
    final Response response = await _client.post(_URL_TRANSACAO,
        headers: {
          'Content-Type': 'application/json',
          'password': '1000',
        },
        body: transacaoJson);

    return Transferencia.fromJson(jsonDecode(response.body));
  }
}
