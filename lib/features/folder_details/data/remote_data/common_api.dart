import '../../../../network/api_request.dart';
import '../../../../network/endpoints.dart';

class CommonApi extends APIRequest {
  ///
  CommonApi.login(String username, String password)
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
