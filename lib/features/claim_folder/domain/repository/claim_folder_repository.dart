import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../../data/models/claim_folder_model.dart';

abstract interface class ClaimFolderRepository {
  Future<Either<APIErrors, ClaimFolderModel>> createFolder({
    required String token,
    required String externalClaimId,
  });
  Future<Either<APIErrors, ClaimFolderModel>> getFolder({
    required String token,
    required String externalClaimId,
  });
}
