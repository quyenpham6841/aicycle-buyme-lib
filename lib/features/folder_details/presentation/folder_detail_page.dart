// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../aicycle_buyme_lib.dart';
import '../../../enum/car_part_direction.dart';
import '../../../generated/assets.gen.dart';
import '../../common/app_string.dart';
import '../../common/base_widget.dart';
import '../../common/c_button.dart';
import '../../common/c_loading_view.dart';
import '../../common/themes/c_colors.dart';
import '../controller/folder_detail_controller.dart';
import 'widgets/car_position.dart';
import 'widgets/is_one_car_widget.dart';

class FolderDetailPage extends StatefulWidget {
  const FolderDetailPage({super.key});

  @override
  State<FolderDetailPage> createState() => _FolderDetailPageState();
}

class _FolderDetailPageState
    extends BaseState<FolderDetailPage, FolderDetailController> {
  @override
  FolderDetailController provideController() {
    if (Get.isRegistered<FolderDetailController>()) {
      return Get.find<FolderDetailController>();
    } else {
      return Get.put(FolderDetailController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.white,
        elevation: 0.7,
      ),
      body: LoadingView<FolderDetailController>(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(32),

                    /// Check car
                    Obx(() {
                      if (controller.checkCarModel() != null) {
                        return IsOneCarWidget(
                          checkCarModel: controller.checkCarModel(),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                    Container(
                      height: 500,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Assets.images.car.image(
                              package: packageName,
                              height: 167,
                              width: 113,
                            ),
                          ),

                          /// 2 Góc sau
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CarPosition(
                                    direction: CarPartDirectionEnum.d45LeftBack,
                                    images: controller.images.value,
                                  ),
                                  CarPosition(
                                    direction:
                                        CarPartDirectionEnum.d45RightBack,
                                    images: controller.images.value,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Tem đăng kiểm
                          Positioned(
                            left: 0,
                            child: Obx(
                              () => CarPosition(
                                images: controller.images.value,
                                direction: CarPartDirectionEnum.leftProd,
                              ),
                            ),
                          ),

                          /// trước trái
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Obx(
                              () => CarPosition(
                                images: controller.images.value,
                                direction: CarPartDirectionEnum.d45LeftFront,
                              ),
                            ),
                          ),

                          /// Trước phải
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Obx(
                              () => CarPosition(
                                images: controller.images.value,
                                direction: CarPartDirectionEnum.d45RightFront,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// button
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 32,
              ),
              decoration: const BoxDecoration(color: Colors.white),
              child: CButton(
                onPressed: () {},
                title: AppString.viewResult,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
