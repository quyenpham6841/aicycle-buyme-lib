import '../../../../network/api_request.dart';
import '../../../../network/endpoints.dart';

class ExampleAPI extends APIRequest {
  ///
  ExampleAPI.login(String username, String password)
      : super(
          endpoint: Endpoint.login,
          method: HTTPMethod.post,
          isLogResponse: true,
          body: {
            "phoneNumber": username,
            "password": password,
          },
        );
}
