import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../../domain/repository/claim_folder_repository.dart';
import '../models/claim_folder_model.dart';
import '../remote_data/folder_api.dart';

class ClaimFolderRepositoryImpl implements ClaimFolderRepository {
  @override
  Future<Either<APIErrors, ClaimFolderModel>> createFolder(
      {required String token, required String externalClaimId}) async {
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

  @override
  Future<Either<APIErrors, ClaimFolderModel>> getFolder(
      {required String token, required String externalClaimId}) async {
    try {
      final body =
          await FolderApi.get(token: token, externalClaimId: externalClaimId)
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
