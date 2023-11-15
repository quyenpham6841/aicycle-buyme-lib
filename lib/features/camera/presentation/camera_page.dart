import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/camera_page_controller.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late final CameraPageController controller;
  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<CameraPageController>()) {
      controller = Get.find<CameraPageController>();
    } else {
      controller = Get.put(CameraPageController());
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
        // leadingWidth: 0,
        // bottom: _tabs(),
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
    );
  }
}
