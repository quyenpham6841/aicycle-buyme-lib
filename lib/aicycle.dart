import 'package:camera/camera.dart';

import 'features/folder_details/controller/folder_detail_controller.dart';
import 'injection_container.dart';

class AICycle {
  static Future<void> initial() async {
    InjectionContainer.initial();
    cameras = await availableCameras();
  }
}
