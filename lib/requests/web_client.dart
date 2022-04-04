import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:web_api/requests/interceptor.dart';

final String _hostIP = '';
final String _port = '8080';

void findAll() async {
  final http.Client client = InterceptedClient.build(interceptors: [
    Interceptor(),
  ]);
  final http.Response response =
      await client.get(Uri.http('${_hostIP + ':' + _port}', '/transactions'));
}
