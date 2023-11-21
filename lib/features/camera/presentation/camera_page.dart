import 'dart:io';

import 'package:aicycle_buyme_lib/features/common/app_string.dart';
import 'package:aicycle_buyme_lib/features/common/themes/c_textstyle.dart';

import '../../../enum/car_model.dart';
import '../../../enum/car_part_direction.dart';
import '../../common/base_widget.dart';
import '../../common/c_loading_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/themes/c_colors.dart';
import 'controller/camera_page_controller.dart';
import 'widgets/buy_me_camera_bottom_bar.dart';
import 'widgets/buy_me_preview_image.dart';
import 'widgets/guide_frame.dart';

class BuyMeCameraArgument {
  final CarPartDirectionEnum carPartDirectionEnum;
  final CarModelEnum carModelEnum;
  final int claimId;

  BuyMeCameraArgument({
    required this.carPartDirectionEnum,
    required this.carModelEnum,
    required this.claimId,
  });
}

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.argument});
  final BuyMeCameraArgument argument;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends BaseState<CameraPage, CameraPageController> {
  @override
  void initState() {
    super.initState();
    controller.argument = widget.argument;
  }

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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: CColors.white),
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
            if (controller.isInActive.isTrue ||
                controller.cameraController == null ||
                controller.cameraController?.value.isInitialized != true) {
              return const SizedBox.expand(
                child: Center(
                  child: CupertinoActivityIndicator(color: CColors.white),
                ),
              );
            }
            final frameAspectRatio = MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height - kToolbarHeight);
            final scale = 1 /
                (controller.cameraController!.value.aspectRatio *
                    frameAspectRatio);
            return SafeArea(
              child: Stack(
                children: [
                  /// camera view
                  Transform.scale(
                    scale: scale,
                    child: CameraPreview(
                      controller.cameraController!,
                    ),
                  ),
                  Obx(() {
                    if (controller.showGuideFrame.isTrue &&
                        controller.previewFile() == null &&
                        widget.argument.carPartDirectionEnum.id != 31 &&
                        widget.argument.carPartDirectionEnum.id != 22) {
                      return Positioned.fill(
                        bottom: 100,
                        top: 32,
                        child: GuideFrame(
                          carPartDirectionEnum:
                              widget.argument.carPartDirectionEnum,
                          carModelEnum: CarModelEnum.kiaMorning,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),

                  /// Preview
                  Obx(() {
                    if (controller.previewFile() != null) {
                      return RotatedBox(
                        quarterTurns: Platform.isIOS ? 1 : 0,
                        child: Stack(
                          children: [
                            BuyMePreviewImage(
                              file: File(controller.previewFile()!.path),
                              retake: controller.showRetake()
                                  ? controller.retakePhoto
                                  : null,
                              save: () {},
                            ),
                            if (controller.isResizing())
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  width: screenWidth / 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        AppString.compressing,
                                        style: CTextStyles.base.s14.whiteColor
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                      const LinearProgressIndicator(),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),

                  /// bottom bar buttons
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => controller.previewFile() == null
                          ? BuyMeCameraBottomBar(
                              previewFile: controller.previewFile(),
                              showToggleFrame: widget
                                          .argument.carPartDirectionEnum.id !=
                                      31 &&
                                  widget.argument.carPartDirectionEnum.id != 22,
                              onToggleFrameCallBack: controller.showGuideFrame,
                              takePhoto: controller.takePhoto,
                              pickImage: () {},
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
