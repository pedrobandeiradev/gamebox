abstract class BaseHTTPRequest {
  String get endpoint;
  HttpMethod get httpMethod;
  Map<String, dynamic> get headers;
  Map<String, dynamic> get body;
  Map<String, dynamic> get params;
}

class BaseRequest implements BaseHTTPRequest {
  @override
  Map<String, dynamic> get body => <String, dynamic>{};

  @override
  Map<String, dynamic> get headers => <String, dynamic>{};

  @override
  Map<String, dynamic> get params => <String, dynamic>{};

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  String get endpoint => '';
}

enum HttpMethod {
  get,
  post,
  put,
  delete,
}
