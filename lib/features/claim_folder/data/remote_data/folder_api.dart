import '../../../../network/api_request.dart';
import '../../../../network/endpoints.dart';

class FolderApi extends APIRequest {
  ///
  FolderApi.create({required String token, required String externalClaimId})
      : super(
          endpoint: Endpoint.claimFolders,
          method: HTTPMethod.post,
          isLogResponse: true,
          headers: {"Authorization": "Bearer $token"},
          body: {
            "externalClaimId": externalClaimId,
            "claimName": externalClaimId,
          },
        );

  FolderApi.get({required String token, required String externalClaimId})
      : super(
          endpoint: Endpoint.claimFolders,
          method: HTTPMethod.get,
          isLogResponse: true,
          headers: {"Authorization": "Bearer $token"},
          query: {
            "externalClaimId": externalClaimId,
          },
        );
}
