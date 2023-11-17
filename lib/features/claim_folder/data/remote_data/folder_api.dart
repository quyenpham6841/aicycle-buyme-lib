import '../../../../network/api_request.dart';
import '../../../../network/endpoints.dart';

class FolderApi extends APIRequest {
  ///
  FolderApi.create({required String token, required int externalClaimId})
      : super(
          endpoint: Endpoint.createFolder,
          method: HTTPMethod.post,
          isLogResponse: true,
          headers: {"Authorization": "Bearer $token"},
          body: {
            "externalClaimId": externalClaimId,
            "claimName": "$externalClaimId"
          },
        );
}
