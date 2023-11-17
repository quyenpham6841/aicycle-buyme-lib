import '../../aicycle_buyme_lib.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../generated/assets.gen.dart';
import '../../network/api_error.dart';
import 'themes/c_colors.dart';
import 'themes/c_textstyle.dart';

enum SnackBarType { success, error, info, warning }

class Utils {
  Utils._();
  static final Utils instance = Utils._();

  static void dismissKeyboard() => Get.focusScope?.unfocus();

  void showError(
    BuildContext context, {
    String? message,
    APIErrors? error,
    bool? keepCurrentDialogOpen,
    Widget? prefix,
  }) {
    _showSnackBar(
      context,
      message ?? '',
      type: SnackBarType.error,
      prefix: prefix,
    );
  }

  void showSuccess(
    BuildContext context,
    String message, {
    APIErrors? error,
    bool? keepCurrentDialogOpen,
    Widget? prefix,
  }) {
    _showSnackBar(
      context,
      message,
      type: SnackBarType.success,
      prefix: prefix,
    );
  }

  void showWarning(
    BuildContext context,
    String message, {
    APIErrors? error,
    bool? keepCurrentDialogOpen,
    Widget? prefix,
  }) {
    _showSnackBar(
      context,
      message,
      type: SnackBarType.warning,
      prefix: prefix,
    );
  }
}

void _showSnackBar(
  BuildContext context,
  String message, {
  SnackBarType type = SnackBarType.success,
  int duration = 3,
  Widget? prefix,
}) async {
  Widget icon = const Icon(Icons.check);
  Color color = CColors.greenA500;
  // haptic();
  switch (type) {
    case SnackBarType.success:
      icon = Assets.icons.icCheckFilled.svg(package: packageName);
      color = CColors.greenA500;
      break;
    case SnackBarType.error:
      icon = Assets.icons.icErrorFilled.svg(package: packageName);
      color = CColors.redA500;
      break;
    case SnackBarType.info:
      icon = Assets.icons.icInfoFilled.svg(package: packageName);
      color = CColors.primaryA500;
      break;
    case SnackBarType.warning:
      icon = Assets.icons.icWarningFilled.svg(package: packageName);
      color = CColors.orangeA500;
      break;
    default:
      icon = Assets.icons.icWarningFilled.svg(package: packageName);
      color = CColors.greenA500;
      break;
  }
  if (prefix != null) {
    icon = prefix;
  }
  showTopSnackBar(
    Overlay.of(context),
    GetSnackBar(
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      messageText: Row(
        children: [
          icon,
          const Gap(16),
          Expanded(
            child: Text(
              message,
              style: CTextStyles.baseWhite.s14,
            ),
          )
        ],
      ),
    ),
  );
  // Get.showSnackbar(
  //   GetSnackBar(
  //     duration: Duration(seconds: duration),
  //     snackPosition: SnackPosition.TOP,
  //     backgroundColor: color,
  //     margin: const EdgeInsets.all(16),
  //     borderRadius: 8,
  //     messageText: Row(
  //       children: [
  //         icon,
  //         const Gap(16),
  //         Expanded(
  //           child: Text(
  //             message,
  //             style: CTextStyles.baseWhite.s14,
  //           ),
  //         )
  //       ],
  //     ),
  //   ),
  // );
}
