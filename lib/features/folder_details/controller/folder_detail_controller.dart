import 'package:aicycle_buyme_lib/features/common/base_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = <CameraDescription>[];

class FolderDetailController extends BaseController {
  @override
  void onReady() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    super.onReady();
  }
}
