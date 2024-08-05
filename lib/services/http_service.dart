import 'package:api_client/models/request_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> sendRequest(RequestModel request) async {
    switch (request.method) {
      case 'GET':
        return await http.get(Uri.parse(request.url), headers: request.headers);
      case 'POST':
        return await http.post(Uri.parse(request.url),
            headers: request.headers, body: request.body);
      // TODO: Add support for other HTTP methods
      default:
        throw Exception('Unsupported method: ${request.method}');
    }
  }
}
