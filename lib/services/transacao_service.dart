import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'loggin_interceptor.dart';

const String _PATH = 'http://192.168.56.1:8080';

class TransacaoService {
  void todas() async {
    final Client client =HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
    await client.get('$_PATH/transactions');
  }
}
