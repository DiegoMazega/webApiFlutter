import 'package:http_interceptor/http_interceptor.dart';

class Interceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('REQUEST');
    print('URL: ${data.baseUrl}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE');
    print('STATUS: ${data.statusCode}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }
}
