import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpManager {
  final _baseUrl = 'http://192.168.0.106:8080/api';
  final String? resource;

  HttpManager({this.resource});

  Future<Response> post(
    void Function(Request) consumer, {
    final String? resource,
  }) {
    final request = Request();
    consumer(request);
    return http.post(
      Uri.parse('$_baseUrl${resource ?? this.resource ?? ''}'),
      headers: request.headers,
      body: jsonEncode(request.body),
    );
  }
}

class Request {
  final _headers = {'Content-Type': 'application/json'};
  final _body = <String, dynamic>{};

  Map<String, String> get headers => _headers;

  Map<String, dynamic> get body => _body;
}
