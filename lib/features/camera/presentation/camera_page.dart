import '../../common/base_widget.dart';
import '../../common/c_loading_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/themes/c_colors.dart';
import '../controller/camera_page_controller.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends BaseState<CameraPage, CameraPageController> {
  @override
  CameraPageController provideController() {
    if (Get.isRegistered<CameraPageController>()) {
      return Get.find<CameraPageController>();
    } else {
      return Get.put(CameraPageController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: controller.switchFlashMode,
              child: Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black54,
                ),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                    child: Obx(
                      () => Icon(
                        controller.flashMode() == FlashMode.off
                            ? Icons.flash_off_outlined
                            : Icons.flash_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: LoadingView<CameraPageController>(
        child: GetBuilder<CameraPageController>(
          id: 'camera',
          builder: (ctrl) {
            if (controller.cameraController == null ||
                controller.cameraController?.value.isInitialized != true) {
              return const SizedBox.expand(
                child: Center(
                  child: CupertinoActivityIndicator(color: CColors.white),
                ),
              );
            }
            final scale = 1 /
                (controller.cameraController!.value.aspectRatio *
                    MediaQuery.of(context).size.aspectRatio);
            return RotatedBox(
              quarterTurns: 1,
              child: Transform.scale(
                scale: scale,
                child: CameraPreview(
                  controller.cameraController!,
                  child: Stack(
                    children: [
                      // Positioned.fill(
                      //   bottom: 100,
                      //   top: 32,
                      //   child: GuideFrame(
                      //     carPartDirectionEnum:
                      //         widget.argument.carPartDirectionEnum,
                      //     rangeShot: 'longShot'.tr(),
                      //     showDirectionInfo: false,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
