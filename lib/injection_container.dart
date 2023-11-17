import 'package:get/get.dart';

import 'features/folder_details/data/repository/example_repository_impl.dart';
import 'features/folder_details/domain/usecase/login_usecase.dart';

class InjectionContainer {
  InjectionContainer._();

  static initial() {
    _auth();
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
}
