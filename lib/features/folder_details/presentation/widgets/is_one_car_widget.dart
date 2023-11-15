// ignore_for_file: deprecated_member_use_from_same_package

import '../../../../aicycle_buyme_lib.dart';
import '../../../common/themes/c_colors.dart';
import '../../../common/themes/c_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../enum/check_car_state.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../types/check_car_model.dart';

class IsOneCarWidget extends StatelessWidget {
  final CheckCarModel? checkCarModel;
  const IsOneCarWidget({super.key, required this.checkCarModel});

  @override
  Widget build(BuildContext context) {
    if (checkCarModel?.message == null ||
        checkCarModel?.message?.isEmpty == true) {
      return const SizedBox.shrink();
    }
    bool isOneCar = checkCarModel?.state == CheckCarState.isTheSameCar.id ||
        checkCarModel?.state == CheckCarState.init.id;
    return Container(
      decoration: BoxDecoration(
        color: isOneCar ? CColors.greenA100 : CColors.orangeA100,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          isOneCar
              ? Assets.icons.icCheckFilled.svg(
                  package: packageName,
                  width: 20,
                  height: 20,
                  color: CColors.greenA500,
                )
              : Assets.icons.icWarning.svg(
                  package: packageName,
                  width: 20,
                  height: 20,
                  color: CColors.orangeA500,
                ),
          const Gap(10),
          Expanded(
            child: Text(
              checkCarModel?.message ?? '',
              style: CTextStyles.base.s14.copyWith(
                color: CColors.lightTextPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
