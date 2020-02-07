import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('##################################################');
    print('################## REQUEST DATA ##################');
    print('${data.method}: ${data.baseUrl}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('################## RESPONSE DATA ##################');
    print('${data.method}:  ${data.url}');
    print('STATUS: ${data.statusCode}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    print('##################################################');
    return data;
  }
}