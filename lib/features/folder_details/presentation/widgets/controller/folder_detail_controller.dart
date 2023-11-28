import '../../../../../enum/app_state.dart';
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
  String? claimId;

  @override
  void onReady() {
    super.onReady();
    getImageInfo();
  }

  void getImageInfo() async {
    if (claimId == null) {
      return;
    }
    isLoading(true);
    var res = await getImageInfoUsecase(claimId!);
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
