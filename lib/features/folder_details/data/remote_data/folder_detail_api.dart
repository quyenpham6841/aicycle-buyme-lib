import '../../../../network/api_request.dart';
import '../../../../network/endpoints.dart';

class FolderDetailApi extends APIRequest {
  ///
  FolderDetailApi.getImageInfor(String claimId)
      : super(
          endpoint:
              Endpoint.getImageInformation.replaceAll('{claimId}', claimId),
          method: HTTPMethod.get,
          isLogResponse: true,
        );
}
