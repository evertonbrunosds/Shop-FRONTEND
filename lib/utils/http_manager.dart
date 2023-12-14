import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpManager {
  final _baseUrl = 'http://192.168.0.106:8080/api';
  final String? resource;

  HttpManager({this.resource});

  void post(
    void Function(Request) consumer, {
    final String? resource,
  }) {
    final request = Request();
    consumer(request);
    http.post(
      Uri.parse('$_baseUrl${resource ?? this.resource ?? ''}'),
      headers: request.headers,
      body: jsonEncode(request.body),
    );
  }
}

class Request {
  final _headers = {'Content-Type': 'application/json'};
  final _body = <String, Object>{};

  Map<String, String> get headers => _headers;

  Map<String, Object> get body => _body;
}
