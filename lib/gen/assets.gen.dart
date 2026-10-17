// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/home
  $AssetsImagesHomeGen get home => const $AssetsImagesHomeGen();

  /// Directory path: assets/images/login
  $AssetsImagesLoginGen get login => const $AssetsImagesLoginGen();
}

class $AssetsImagesHomeGen {
  const $AssetsImagesHomeGen();

  /// File path: assets/images/home/BracBank.png
  AssetGenImage get bracBank =>
      const AssetGenImage('assets/images/home/BracBank.png');

  /// File path: assets/images/home/CareGiver.png
  AssetGenImage get careGiver =>
      const AssetGenImage('assets/images/home/CareGiver.png');

  /// File path: assets/images/home/Emergency.png
  AssetGenImage get emergency =>
      const AssetGenImage('assets/images/home/Emergency.png');

  /// File path: assets/images/home/LabTest.png
  AssetGenImage get labTest =>
      const AssetGenImage('assets/images/home/LabTest.png');

  /// File path: assets/images/home/LiveDoctor.png
  AssetGenImage get liveDoctor =>
      const AssetGenImage('assets/images/home/LiveDoctor.png');

  /// File path: assets/images/home/MasterCard.png
  AssetGenImage get masterCard =>
      const AssetGenImage('assets/images/home/MasterCard.png');

  /// File path: assets/images/home/Medicine.png
  AssetGenImage get medicine =>
      const AssetGenImage('assets/images/home/Medicine.png');

  /// File path: assets/images/home/MentalHealth.png
  AssetGenImage get mentalHealth =>
      const AssetGenImage('assets/images/home/MentalHealth.png');

  /// File path: assets/images/home/Physiotherapy.png
  AssetGenImage get physiotherapy =>
      const AssetGenImage('assets/images/home/Physiotherapy.png');

  /// File path: assets/images/home/Rufaida.png
  AssetGenImage get rufaida =>
      const AssetGenImage('assets/images/home/Rufaida.png');

  /// File path: assets/images/home/Specialist.png
  AssetGenImage get specialist =>
      const AssetGenImage('assets/images/home/Specialist.png');

  /// File path: assets/images/home/StandardChartered.png
  AssetGenImage get standardChartered =>
      const AssetGenImage('assets/images/home/StandardChartered.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bracBank,
        careGiver,
        emergency,
        labTest,
        liveDoctor,
        masterCard,
        medicine,
        mentalHealth,
        physiotherapy,
        rufaida,
        specialist,
        standardChartered
      ];
}

class $AssetsImagesLoginGen {
  const $AssetsImagesLoginGen();

  /// File path: assets/images/login/NeeramoyDoctor.png
  AssetGenImage get neeramoyDoctor =>
      const AssetGenImage('assets/images/login/NeeramoyDoctor.png');

  /// File path: assets/images/login/NeeramoyGreen.jpeg
  AssetGenImage get neeramoyGreen =>
      const AssetGenImage('assets/images/login/NeeramoyGreen.jpeg');

  /// File path: assets/images/login/NeeramoyLogin.png
  AssetGenImage get neeramoyLogin =>
      const AssetGenImage('assets/images/login/NeeramoyLogin.png');

  /// File path: assets/images/login/NeeramoyRed3.png
  AssetGenImage get neeramoyRed3 =>
      const AssetGenImage('assets/images/login/NeeramoyRed3.png');

  /// File path: assets/images/login/NeeramoyRedFinal.png
  AssetGenImage get neeramoyRedFinal =>
      const AssetGenImage('assets/images/login/NeeramoyRedFinal.png');

  /// File path: assets/images/login/NeeramoyRedLogo.png
  AssetGenImage get neeramoyRedLogo =>
      const AssetGenImage('assets/images/login/NeeramoyRedLogo.png');

  /// File path: assets/images/login/RedLogo.png
  AssetGenImage get redLogo =>
      const AssetGenImage('assets/images/login/RedLogo.png');

  /// File path: assets/images/login/neeramoylogo2.png
  AssetGenImage get neeramoylogo2 =>
      const AssetGenImage('assets/images/login/neeramoylogo2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        neeramoyDoctor,
        neeramoyGreen,
        neeramoyLogin,
        neeramoyRed3,
        neeramoyRedFinal,
        neeramoyRedLogo,
        redLogo,
        neeramoylogo2
      ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
