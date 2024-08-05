class RequestModel {
  final String url;
  final String method;
  final Map<String, String> headers;
  final String body;

  RequestModel({
    required this.url,
    required this.method,
    this.headers = const {},
    this.body = '',
  });
}
