import 'package:aicycle_buyme_lib/features/claim_folder/domain/repository/claim_folder_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';

class CreateClaimFolderUseCase {
  final ClaimFolderRepository repository;
  CreateClaimFolderUseCase(this.repository);

  Future<Either<APIErrors, dynamic>> call({
    required String token,
    required int externalClaimId,
  }) async {
    return repository.createFolder(
        token: token, externalClaimId: externalClaimId);
  }
}
