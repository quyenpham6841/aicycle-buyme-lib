/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/loading.gif
  AssetGenImage get loading => const AssetGenImage('assets/gif/loading.gif');

  /// List of all assets
  List<AssetGenImage> get values => [loading];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_camera.svg
  SvgGenImage get icCamera => const SvgGenImage('assets/icons/ic_camera.svg');

  /// File path: assets/icons/ic_check.svg
  SvgGenImage get icCheck => const SvgGenImage('assets/icons/ic_check.svg');

  /// File path: assets/icons/ic_check_circle.svg
  SvgGenImage get icCheckCircle =>
      const SvgGenImage('assets/icons/ic_check_circle.svg');

  /// File path: assets/icons/ic_check_filled.svg
  SvgGenImage get icCheckFilled =>
      const SvgGenImage('assets/icons/ic_check_filled.svg');

  /// File path: assets/icons/ic_error_filled.svg
  SvgGenImage get icErrorFilled =>
      const SvgGenImage('assets/icons/ic_error_filled.svg');

  /// File path: assets/icons/ic_info_filled copy.svg
  SvgGenImage get icInfoFilledCopy =>
      const SvgGenImage('assets/icons/ic_info_filled copy.svg');

  /// File path: assets/icons/ic_info_filled.svg
  SvgGenImage get icInfoFilled =>
      const SvgGenImage('assets/icons/ic_info_filled.svg');

  /// File path: assets/icons/ic_warning.svg
  SvgGenImage get icWarning => const SvgGenImage('assets/icons/ic_warning.svg');

  /// File path: assets/icons/ic_warning_filled.svg
  SvgGenImage get icWarningFilled =>
      const SvgGenImage('assets/icons/ic_warning_filled.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icCamera,
        icCheck,
        icCheckCircle,
        icCheckFilled,
        icErrorFilled,
        icInfoFilledCopy,
        icInfoFilled,
        icWarning,
        icWarningFilled
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/car.png
  AssetGenImage get car => const AssetGenImage('assets/images/car.png');

  /// List of all assets
  List<AssetGenImage> get values => [car];
}

class Assets {
  Assets._();

  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
