import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RequestState extends ChangeNotifier {
  http.Response? _response;
  http.Response? get response => _response;

  void setResponse(http.Response response) {
    _response = response;
    notifyListeners();
  }
}
