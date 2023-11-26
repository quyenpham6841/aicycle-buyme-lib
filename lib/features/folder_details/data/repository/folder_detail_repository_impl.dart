import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../../domain/repository/folder_detail_repository.dart';
import '../models/buy_me_image_model.dart';
import '../remote_data/folder_detail_api.dart';

class FolderDetailRepositoryImpl implements FolderDetailRepository {
  @override
  Future<Either<APIErrors, BuyMeImageResponse>> getImageInfo(
      String claimId) async {
    try {
      final res = await FolderDetailApi.getImageInfor(claimId).request();
      return Right(BuyMeImageResponse.fromJson(res));
    } catch (e) {
      if (e is APIErrors) {
        return Left(e);
      } else {
        return Left(FetchDataError('System error'));
      }
    }
  }

  @override
  Future<Either<APIErrors, bool>> deleteImageById(String imageId) async {
    try {
      final res = await FolderDetailApi.deleteImageById(imageId).request();
      print(res);
      return const Right(true);
    } catch (e) {
      if (e is APIErrors) {
        return Left(e);
      } else {
        return Left(FetchDataError('Delete image failed.'));
      }
    }
  }
}
