import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../aicycle_buyme_lib.dart';
import '../../../enum/app_state.dart';
import '../../../generated/assets.gen.dart';
import '../../common/app_string.dart';
import '../../common/base_widget.dart';
import '../../common/themes/c_colors.dart';
import '../../common/themes/c_textstyle.dart';
import '../../folder_details/presentation/folder_detail_page.dart';
import 'aicycle_buy_me_controller.dart';

String? apiToken;

class AiCycleBuyMeArgument {
  final String externalClaimId;
  final String apiToken;

  AiCycleBuyMeArgument({
    required this.externalClaimId,
    required this.apiToken,
  });
}

class AiCycleBuyMe extends StatefulWidget {
  const AiCycleBuyMe({super.key, required this.argument});
  final AiCycleBuyMeArgument argument;

  @override
  State<AiCycleBuyMe> createState() => _AiCycleBuyMeState();
}

class _AiCycleBuyMeState
    extends BaseState<AiCycleBuyMe, AiCycleBuyMeController> {
  @override
  AiCycleBuyMeController provideController() {
    if (Get.isRegistered<AiCycleBuyMeController>()) {
      return Get.find<AiCycleBuyMeController>();
    }
    return Get.put(AiCycleBuyMeController());
  }

  @override
  void initState() {
    super.initState();
    controller.argument = widget.argument;
    apiToken = widget.argument.apiToken;
    controller.status.listen((state) {
      if (state.state == AppState.redirect) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => FolderDetailPage(
              claimFolderId: controller.claimFolder.value?.claimId ?? '',
              externalClaimId: widget.argument.externalClaimId,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CColors.primaryA400,
              CColors.primaryA500,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.logo.image(
              package: packageName,
              width: 300,
            ),
            const Gap(24),
            Text(
              AppString.pleaseWait,
              style: CTextStyles.base.s16.whiteColor,
            ),
            const Gap(12),
            SizedBox(
              width: 240,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(2),
                color: CColors.active,
              ),
            )
          ],
        ),
      ),
    );
  }
}
