import '../../../types/buy_me_image_model.dart';

import '../../common/base_controller.dart';
import '../../../types/check_car_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<CameraDescription> cameras = <CameraDescription>[];

class FolderDetailController extends BaseController {
  var checkCarModel = Rx<CheckCarModel?>(null);
  var images = <BuyMeImage>[].obs;
  @override
  void onReady() async {
    WidgetsFlutterBinding.ensureInitialized();
    // cameras = await availableCameras();
    super.onReady();
  }
}
