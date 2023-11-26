import 'package:aicycle_buyme_lib/enum/app_state.dart';

import '../../../../common/base_controller.dart';
import '../../../../../types/check_car_model.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

import '../../../data/models/buy_me_image_model.dart';
import '../../../domain/usecase/get_image_info_usecase.dart';

List<CameraDescription> cameras = <CameraDescription>[];

class FolderDetailController extends BaseController {
  final GetImageInfoUsecase getImageInfoUsecase = Get.find();
  var checkCarModel = Rx<CheckCarModel?>(null);
  var imageInfo = Rx<BuyMeImageResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    getImageInfo();
  }

  void getImageInfo() async {
    isLoading(true);
    var res = await getImageInfoUsecase('25887');
    res.fold(
      (l) {
        isLoading(false);
        status.value = BaseStatus(message: l.message, state: AppState.failed);
      },
      (r) {
        isLoading(false);
        imageInfo.value = r;
      },
    );
  }
}
