import 'package:get/get.dart';

import 'features/camera/data/repository/camera_repository_impl.dart';
import 'features/camera/domain/usecase/upload_image_usecase.dart';
import 'features/folder_details/data/repository/example_repository_impl.dart';
import 'features/folder_details/domain/usecase/login_usecase.dart';
import 'features/camera/domain/usecase/call_engine_usecase.dart';

class InjectionContainer {
  InjectionContainer._();

  static initial() {
    _auth();
    _camera();
  }

  static void _auth() {
    Get.lazyPut(
      () => ExampleRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginUsecase(Get.find<ExampleRepositoryImpl>()),
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
