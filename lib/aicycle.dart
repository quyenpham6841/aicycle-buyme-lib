import 'package:camera/camera.dart';
import 'package:get/get.dart';

import 'features/claim_folder/domain/usecase/create_claim_folder_usecase.dart';
import 'features/folder_details/controller/folder_detail_controller.dart';
import 'injection_container.dart';

class AICycle {
  static Future<void> initial() async {
    InjectionContainer.initial();
    cameras = await availableCameras();
  }

  static Future<void> createFolder({
    required String token,
    required int externalClaimId,
  }) async {
    final createFolderUseCase = Get.find<CreateClaimFolderUseCase>();
    final res = await createFolderUseCase.call(
        token: token, externalClaimId: externalClaimId);
  }
}
