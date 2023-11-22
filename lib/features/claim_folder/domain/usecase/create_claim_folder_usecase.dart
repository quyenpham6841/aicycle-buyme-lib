import 'package:aicycle_buyme_lib/features/claim_folder/domain/repository/claim_folder_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../../data/models/claim_folder_model.dart';

class CreateClaimFolderUseCase {
  final ClaimFolderRepository repository;
  CreateClaimFolderUseCase(this.repository);

  Future<Either<APIErrors, ClaimFolderModel>> call({
    required String token,
    required String externalClaimId,
  }) async {
    return repository.createFolder(
        token: token, externalClaimId: externalClaimId);
  }
}

class GetClaimFolderUseCase {
  final ClaimFolderRepository repository;
  GetClaimFolderUseCase(this.repository);

  Future<Either<APIErrors, ClaimFolderModel>> call({
    required String token,
    required String externalClaimId,
  }) async {
    return repository.getFolder(token: token, externalClaimId: externalClaimId);
  }
}
