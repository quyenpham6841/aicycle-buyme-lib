import '../../common/base_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

import '../../../enum/app_state.dart';
import '../../folder_details/controller/folder_detail_controller.dart';

class CameraPageController extends BaseController {
  CameraController? cameraController;
  var isInActive = false.obs;
  var showGuideFrame = true.obs;
  var flashMode = Rx<FlashMode>(FlashMode.off);
  var previewFile = Rx<XFile?>(null);

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    if (cameras.isNotEmpty) {
      onNewCameraSelected(cameras[0]);
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (cameras.isEmpty) {
      status.value = BaseStatus(
        message: 'No camera found',
        state: AppState.pop,
      );
    }
    super.onReady();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final CameraController? cameraCtrl = cameraController;
    // App state changed before we got the chance to initialize.
    if (cameraCtrl == null || !cameraCtrl.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      isInActive(true);
      cameraCtrl.dispose();
      update(['camera']);
    } else if (state == AppLifecycleState.resumed) {
      isInActive(false);
      onNewCameraSelected(cameraCtrl.description);
    }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    isLoading(true);
    final CameraController? oldController = cameraController;
    if (oldController != null) {
      cameraController = null;
      await oldController.dispose();
    }
    final CameraController cameraCtrl = CameraController(
      cameraDescription,
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );
    cameraController = cameraCtrl;
    // If the controller is updated then update the UI.
    cameraCtrl.addListener(() {
      if (cameraCtrl.value.hasError) {
        status.value = BaseStatus(
          message: 'Camera error',
          state: AppState.failed,
        );
      }
    });
    try {
      await cameraCtrl.initialize();
      // cameraCtrl.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
      isLoading(false);
    } on CameraException catch (_) {
      isLoading(false);
      status.value = BaseStatus(
        message: 'No camera found',
        state: AppState.pop,
      );
    }
    update(['camera']);
  }

  void switchFlashMode() async {
    if (flashMode() == FlashMode.off) {
      await cameraController?.setFlashMode(FlashMode.torch);
      flashMode.value = FlashMode.torch;
    } else {
      await cameraController?.setFlashMode(FlashMode.off);
      flashMode.value = FlashMode.off;
    }
  }

  void takePhoto() {}
}
