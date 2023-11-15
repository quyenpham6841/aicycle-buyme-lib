import 'package:get/get.dart';
import 'package:camera/camera.dart';

class CameraPageController extends GetxController {
  late final CameraController cameraController;
  var flashMode = Rx<FlashMode>(FlashMode.off);

  void switchFlashMode() async {
    if (flashMode() == FlashMode.off) {
      await cameraController.setFlashMode(FlashMode.always);
      flashMode.value = FlashMode.always;
    } else {
      await cameraController.setFlashMode(FlashMode.off);
      flashMode.value = FlashMode.off;
    }
  }
}
