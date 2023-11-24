import 'package:get/get.dart';

import 'api_provider.dart';
import 'endpoints.dart';

enum HTTPMethod { get, post, delete, put, patch }

class APIRequest {
  String baseUrl = BaseEndpoint.baseUrl;
  String endpoint;
  String contentType;
  HTTPMethod method;
  bool isLogResponse;
  bool isBaseResponse;
  bool isMultiLanguage;
  Map<String, String>? headers;
  Map<String, String>? query;
  dynamic body;

  APIRequest({
    required this.endpoint,
    this.method = HTTPMethod.get,
    Map<String, String>? headers,
    this.query = const {},
    this.body,
    this.contentType = "application/json",
    this.isLogResponse = false,
    String? baseUrl,
    this.isBaseResponse = true,
    this.isMultiLanguage = true,
  }) {
    final baseHeaders = {
      'Authorization': "Bearer ede512f2-1490-4219-a160-3813192d053a",
      if (isMultiLanguage) "lang": Get.locale?.languageCode ?? "vi",
    };
    this.headers = baseHeaders;
    this.headers?.addAll(headers ?? {});
    if (baseUrl != null) {
      this.baseUrl = baseUrl;
    }
  }

  Future request() => APIProvider.instance.request(this);
}
