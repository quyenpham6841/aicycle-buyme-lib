abstract class BaseEndpoint {
  static String get baseUrl => 'https://stage-api-insurance.aicycle.ai/';
  static String get adminBaseUrl => 'https://stage-api-admin.aicycle.ai/';
}

abstract class Endpoint {
  static String get login => '';
  static String get callEngine => '/v2/buy-me/process';
  static String get getImageUploadUrl => '/images/url';
  static String get validateUpload => '/claimimages/validate';
  static String get claimFolders => 'claimfolders';
}
