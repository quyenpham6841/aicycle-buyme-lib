import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../../data/models/buy_me_image_model.dart';

abstract class FolderDetailRepository {
  Future<Either<APIErrors, BuyMeImageResponse>> getImageInfo(
    String claimId,
  );
}
