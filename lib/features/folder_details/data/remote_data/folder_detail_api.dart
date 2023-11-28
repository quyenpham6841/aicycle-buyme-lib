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

  ///
  FolderDetailApi.deleteImageById(String imageId)
      : super(
          endpoint: Endpoint.deleteImageById.replaceAll('{imageId}', imageId),
          method: HTTPMethod.delete,
          isLogResponse: true,
          isBaseResponse: false,
        );

  ///
  FolderDetailApi.checkIsOneCar(String claimId)
      : super(
          endpoint: Endpoint.checkIsOneCar.replaceAll('{claimId}', claimId),
          method: HTTPMethod.get,
          isLogResponse: true,
        );
}
