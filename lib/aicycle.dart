import 'package:camera/camera.dart';

import 'features/folder_details/presentation/widgets/controller/folder_detail_controller.dart';
import 'injection_container.dart';

export 'features/aicycle_buy_me/presentation/aicycle_buy_me.dart' hide apiToken;

class AICycle {
  static Future<void> initial() async {
    InjectionContainer.initial();
    cameras = await availableCameras();
  }
}
