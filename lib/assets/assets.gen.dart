/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// Directory path: lib/assets/img
  $LibAssetsImgGen get img => const $LibAssetsImgGen();
}

class $LibAssetsImgGen {
  const $LibAssetsImgGen();

  /// File path: lib/assets/img/google.png
  AssetGenImage get google => const AssetGenImage('lib/assets/img/google.png');

  /// File path: lib/assets/img/me.png
  AssetGenImage get me => const AssetGenImage('lib/assets/img/me.png');

  /// File path: lib/assets/img/slide1.png
  AssetGenImage get slide1 => const AssetGenImage('lib/assets/img/slide1.png');

  /// File path: lib/assets/img/slide2.png
  AssetGenImage get slide2 => const AssetGenImage('lib/assets/img/slide2.png');

  /// File path: lib/assets/img/slide3.png
  AssetGenImage get slide3 => const AssetGenImage('lib/assets/img/slide3.png');

  /// File path: lib/assets/img/splash.png
  AssetGenImage get splash => const AssetGenImage('lib/assets/img/splash.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [google, me, slide1, slide2, slide3, splash];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $LibGen lib = $LibGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
