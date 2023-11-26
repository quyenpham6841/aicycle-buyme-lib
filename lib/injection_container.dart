import 'features/claim_folder/data/repository/claim_folder_repository_impl.dart';
import 'features/claim_folder/domain/usecase/create_claim_folder_usecase.dart';
import 'features/folder_details/data/repository/folder_detail_repository_impl.dart';
import 'features/folder_details/domain/usecase/get_image_info_usecase.dart';
import 'package:get/get.dart';

import 'features/camera/data/repository/camera_repository_impl.dart';
import 'features/camera/domain/usecase/upload_image_usecase.dart';
import 'features/camera/domain/usecase/call_engine_usecase.dart';

class InjectionContainer {
  InjectionContainer._();

  static initial() {
    _auth();
    _camera();
    _folderDetail();
  }

  static void _auth() {
    Get.lazyPut(
      () => ClaimFolderRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateClaimFolderUseCase(Get.find<ClaimFolderRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => GetClaimFolderUseCase(Get.find<ClaimFolderRepositoryImpl>()),
      fenix: true,
    );
  }

  static void _folderDetail() {
    Get.lazyPut(
      () => FolderDetailRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut(
      () => GetImageInfoUsecase(Get.find<FolderDetailRepositoryImpl>()),
      fenix: true,
    );
  }

  static void _camera() {
    Get.lazyPut(
      () => CameraRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut(
      () => CallEngineUsecase(Get.find<CameraRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => UploadImageUsecase(Get.find<CameraRepositoryImpl>()),
      fenix: true,
    );
  }
}
