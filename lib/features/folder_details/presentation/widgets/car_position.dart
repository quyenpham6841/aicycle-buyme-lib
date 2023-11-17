// ignore_for_file: deprecated_member_use_from_same_package

import 'package:aicycle_buyme_lib/features/camera/presentation/camera_page.dart';
import 'package:aicycle_buyme_lib/features/common/themes/c_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../aicycle_buyme_lib.dart';
import '../../../common/cache_image_widget.dart';
import '../../../common/themes/c_colors.dart';
import '../../../../types/buy_me_image_model.dart';
import '../../../../enum/car_part_direction.dart';
import '../../../../generated/assets.gen.dart';

class CarPosition extends StatelessWidget {
  final CarPartDirectionEnum direction;
  final List<BuyMeImage>? images;
  const CarPosition({
    super.key,
    required this.direction,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    final scrWidth = MediaQuery.of(context).size.width;
    final String? image = images
        ?.firstWhere(
          (e) =>
              e.directionSlug == direction.excelId.toString() ||
              e.directionId == direction.id.toString(),
          orElse: () => const BuyMeImage(),
        )
        .imageUrl;

    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CameraPage(),
      )),
      child: Column(
        children: [
          image == null
              ? Container(
                  padding: const EdgeInsets.all(12),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Assets.icons.icCamera.svg(
                    color: CColors.primaryA500,
                    package: packageName,
                  ),
                )
              : CachedImageWidget(
                  url: image,
                  width: 40,
                  height: 40,
                  borderRadius: 4,
                ),
          const Gap(10),
          Container(
            width: (0.8 * scrWidth) / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              direction.buyMeTitle,
              textAlign: TextAlign.center,
              style: CTextStyles.base.s12.setColor(CColors.inkA500),
            ),
          ),
        ],
      ),
    );
  }
}