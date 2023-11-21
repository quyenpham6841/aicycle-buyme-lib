import 'package:aicycle_buyme_lib/network/api_error.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/damage_assessment_response.dart';
import '../../data/models/image_upload_response.dart';

abstract class CameraRepository {
  Future<Either<APIErrors, DamageAssessmentResponse>>
      callAiEngineAfterTakePhotoV2({
    required int claimId,
    required String imageName,
    required String filePath,
    required String position,
    required String direction,
    required String vehiclePartExcelId,
    required bool isCapDon,
    int? oldImageId,
    double? timeAppUpload,
    String? resizePath,
    String? locationName,
    String? uploadLocation,
    String? utcTimeCreated,
  });

  Future<Either<APIErrors, ImageUploadResponse>> uploadImageToS3Server({
    required String localFilePath,
  });
}
