import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../../data/models/buy_me_image_model.dart';
import '../repository/folder_detail_repository.dart';

class GetImageInfoUsecase {
  final FolderDetailRepository repository;
  GetImageInfoUsecase(this.repository);

  Future<Either<APIErrors, BuyMeImageResponse>> call(
    String claimId,
  ) {
    return repository.getImageInfo(claimId);
  }
}
