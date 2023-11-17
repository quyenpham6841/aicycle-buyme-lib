import 'package:aicycle_buyme_lib/features/claim_folder/data/models/claim_folder_model.dart';
import 'package:aicycle_buyme_lib/features/claim_folder/data/remote_data/folder_api.dart';
import 'package:aicycle_buyme_lib/features/claim_folder/domain/repository/claim_folder_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';

class ClaimFolderRepositoryImpl implements ClaimFolderRepository {
  @override
  Future<Either<APIErrors, ClaimFolderModel>> createFolder(
      {required String token, required int externalClaimId}) async {
    try {
      final body =
          await FolderApi.create(token: token, externalClaimId: externalClaimId)
              .request();
      final List<dynamic> data = List<dynamic>.from(body);
      if (data.isNotEmpty) {
        return Right(ClaimFolderModel.fromMap(data.first));
      }
      return Left(NoMessageError());
    } on APIErrors catch (error) {
      return Left(error);
    }
  }
}
