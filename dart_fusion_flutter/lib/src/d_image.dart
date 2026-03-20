// ignore_for_file: deprecated_member_use

part of '../dart_fusion_flutter.dart';

/// The type of image to be displayed.
enum DImageType {
  /// Load bitmap image from asset.
  bitmapAsset,

  /// Load bitmap image from network.
  bitmapNetwork,

  /// Load bitmap image from file.
  bitmapFile,

  /// Load bitmap image from memory.
  bitmapMemory,

  /// Load vector image from asset.
  vectorAsset,

  /// Load vector image from network.
  vectorNetwork,

  /// Load vector image from file.
  vectorFile,

  /// Load vector image from memory.
  vectorMemory,

  /// Let [DImage] choose the image type automatically.
  auto,
}

/// A widget for displaying vector or bitmap images from different sources.
///
/// ```dart
// Vector / Bitmap image from file
/// DImage(source: File('path/to/images.svg'))
///
/// // Vector / Bitmap image from asset
/// DImage(source: 'assets/image/image.png');
///
/// // Vector / Bitmap image from Uint8List
/// DImage(source: Uint8List());
///
/// // Vector / Bitmap image from network
/// DImage(source: 'http://image.dom/asset.svg');
/// ```
class DImage<Source extends Object> extends StatelessWidget {
  /// Creates an [DImage] widget with the specified [source].
  ///
  /// The [source] parameter is the path or URL of the image to be displayed.
  /// The [size] parameter is the desired size of the image.
  /// The [fit] parameter specifies how the image should be inscribed into the space allocated for it.
  /// The [color] parameter is used to apply a color filter to the image.
  /// The [colorBlendMode] parameter determines how the [color] should be blended with the image.
  /// The [alignment] parameter specifies how the image should be aligned within its container.
  /// The [placeholderBuilder] parameter is used to build a placeholder widget while the image is being loaded.
  /// The [semanticsLabel] parameter is used to provide a description of the image for accessibility purposes.
  /// The [errorBuilder] parameter is used to build a widget when the image fails to load.
  const DImage({
    super.key,
    required this.source,
    this.size,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.placeholderBuilder,
    this.semanticsLabel,
    this.errorBuilder,
    this.theme,
    this.allowDrawingOutsideViewBox = false,
    this.clipBehavior = Clip.hardEdge,
    this.excludeFromSemantics = false,
    this.colorFilter,
    this.matchTextDirection = false,
    this.scale = 1.0,
    this.repeat = ImageRepeat.noRepeat,
    this.opacity,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.low,
    this.cacheWidth,
    this.cacheHeight,
    this.centerSlice,
    this.package,
    this.bundle,
    this.gaplessPlayback = false,
    this.headers,
    this.type = DImageType.auto,
    this.print = true,
  });

  /// The type of image to be displayed.
  final DImageType type;

  /// The source of the image to be displayed.
  final Source source;

  /// The desired size of the image.
  final Size? size;

  /// How the image should be inscribed into the space allocated for it.
  final BoxFit fit;

  /// A color filter to apply to the image.
  final Color? color;

  /// The blending mode to apply to the [color].
  final BlendMode? colorBlendMode;

  /// The alignment of the image within its container.
  final Alignment alignment;

  /// A builder function to create a placeholder widget while the image is being loaded.
  final Widget Function(BuildContext)? placeholderBuilder;

  /// A description of the image for accessibility purposes.
  final String? semanticsLabel;

  /// A builder function to create a widget when the image fails to load.
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  /// Theme used in [SvgPicture].
  final SvgTheme? theme;

  /// If true, will allow the SVG to be drawn outside of the clip boundary of its viewBox.
  final bool allowDrawingOutsideViewBox;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Color filter used in [SvgPicture]
  final ColorFilter? colorFilter;

  /// Whether to exclude this picture from semantics.
  ///
  /// Useful for pictures which do not contribute meaningful information to an application.
  final bool excludeFromSemantics;

  /// If true, will horizontally flip the picture in [TextDirection.rtl] contexts.
  final bool matchTextDirection;

  /// This option only used for [Image] widget.
  final double scale;

  /// How to paint any portions of the layout bounds not covered by the image.
  ///
  /// Only used in [Image] widget.
  final ImageRepeat repeat;

  /// Fade animation, only used in [Image] widget.
  final Animation<double>? opacity;

  /// Whether to paint the image with anti-aliasing.
  ///
  /// Anti-aliasing alleviates the sawtooth artifact when the image is rotated.
  /// This is used in [Image] widget only.
  final bool isAntiAlias;

  /// Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes. The default value is false.
  ///
  /// This is used for [Image] widget only.
  final bool gaplessPlayback;

  /// The rendering quality of the [Image] widget.
  final FilterQuality filterQuality;

  /// The center slice for a nine-patch image. Used in [Image] widget only.
  final Rect? centerSlice;

  /// Caching image based on height, used only for [Image] widget.
  final int? cacheHeight;

  /// Caching image based on width, used only for [Image] widget.
  final int? cacheWidth;

  /// Custom header for fetching image. Used only for [SvgPicture.network] or [Image.network].
  final Map<String, String>? headers;

  /// Asset bundle used in [SvgPicture.asset] and [Image.asset].
  final AssetBundle? bundle;

  /// Package used in [SvgPicture.asset] and [Image.asset].
  final String? package;

  /// If true, the error will be printed.
  final bool print;

  @override
  Widget build(BuildContext context) {
    try {
      switch (type) {
        case DImageType.auto:
          if (source is File) {
            final data = source as File;
            if (data.path.endsWith('.svg')) return _fromVectorFile();
            return _fromBitmapFile();
          } else if (source is Uint8List) {
            try {
              return _fromVectorMemory();
            } catch (e) {
              return _fromBitmapMemory();
            }
          } else {
            String data = source.toString();
            if (data.startsWith("http")) {
              if (data.endsWith(".svg")) return _fromVectorNetwork();
              return _fromBitmapNetwork();
            } else if (data.startsWith('data:image')) {
              if (data.startsWith('data:image/svg')) return _fromVectorMemory();
              return _fromBitmapMemory();
            } else {
              String data = source.toString();
              if (data.endsWith(".svg")) return _fromVectorAsset();
              return _fromBitmapAsset();
            }
          }
        case DImageType.bitmapAsset:
          return _fromBitmapAsset();
        case DImageType.bitmapNetwork:
          return _fromBitmapNetwork();
        case DImageType.bitmapFile:
          return _fromBitmapFile();
        case DImageType.bitmapMemory:
          return _fromBitmapMemory();
        case DImageType.vectorAsset:
          return _fromVectorAsset();
        case DImageType.vectorNetwork:
          return _fromVectorNetwork();
        case DImageType.vectorFile:
          return _fromVectorFile();
        case DImageType.vectorMemory:
          return _fromVectorMemory();
      }
    } catch (e, s) {
      if (kDebugMode && print) DLog(e, level: DLevel.error);
      if (errorBuilder != null) return errorBuilder!(context, e, s);
      return const SizedBox();
    }
  }

  Widget _fromBitmapAsset() {
    return Image.asset(
      source.toString(),
      fit: fit,
      key: key,
      color: color,
      scale: scale,
      bundle: bundle,
      repeat: repeat,
      package: package,
      opacity: opacity,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      cacheHeight: cacheHeight,
      isAntiAlias: isAntiAlias,
      errorBuilder: errorBuilder,
      filterQuality: filterQuality,
      semanticLabel: semanticsLabel,
      colorBlendMode: colorBlendMode,
      gaplessPlayback: gaplessPlayback,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, _, __) {
        if (placeholderBuilder != null) return placeholderBuilder!(context);
        return child;
      },
    );
  }

  Widget _fromVectorAsset() {
    return SvgPicture.asset(
      source.toString(),
      fit: fit,
      key: key,
      theme: theme,
      color: color,
      bundle: bundle,
      package: package,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      colorFilter: colorFilter,
      clipBehavior: clipBehavior,
      semanticsLabel: semanticsLabel,
      placeholderBuilder: placeholderBuilder,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
    );
  }

  Widget _fromBitmapFile() {
    return Image.file(
      source is File ? source as File : File(source.toString()),
      fit: fit,
      key: key,
      color: color,
      scale: scale,
      repeat: repeat,
      opacity: opacity,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      cacheHeight: cacheHeight,
      isAntiAlias: isAntiAlias,
      errorBuilder: errorBuilder,
      filterQuality: filterQuality,
      semanticLabel: semanticsLabel,
      colorBlendMode: colorBlendMode,
      gaplessPlayback: gaplessPlayback,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, _, __) {
        if (placeholderBuilder != null) return placeholderBuilder!(context);
        return child;
      },
    );
  }

  Widget _fromVectorFile() {
    return SvgPicture.file(
      source is File ? source as File : File(source.toString()),
      fit: fit,
      key: key,
      theme: theme,
      color: color,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      colorFilter: colorFilter,
      clipBehavior: clipBehavior,
      semanticsLabel: semanticsLabel,
      placeholderBuilder: placeholderBuilder,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
    );
  }

  Widget _fromBitmapNetwork() {
    return Image.network(
      source.toString(),
      fit: fit,
      key: key,
      color: color,
      scale: scale,
      repeat: repeat,
      opacity: opacity,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      cacheHeight: cacheHeight,
      isAntiAlias: isAntiAlias,
      errorBuilder: errorBuilder,
      filterQuality: filterQuality,
      semanticLabel: semanticsLabel,
      colorBlendMode: colorBlendMode,
      gaplessPlayback: gaplessPlayback,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, _, __) {
        if (placeholderBuilder != null) return placeholderBuilder!(context);
        return child;
      },
      headers: headers,
    );
  }

  Widget _fromVectorNetwork() {
    return SvgPicture.network(
      source.toString(),
      fit: fit,
      key: key,
      theme: theme,
      color: color,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      colorFilter: colorFilter,
      clipBehavior: clipBehavior,
      semanticsLabel: semanticsLabel,
      placeholderBuilder: placeholderBuilder,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      headers: headers,
    );
  }

  Widget _fromBitmapMemory() {
    return Image.memory(
      source is Uint8List
          ? source as Uint8List
          : base64Decode(source.toString().split(',').last),
      fit: fit,
      key: key,
      color: color,
      scale: scale,
      repeat: repeat,
      opacity: opacity,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      cacheHeight: cacheHeight,
      isAntiAlias: isAntiAlias,
      errorBuilder: errorBuilder,
      filterQuality: filterQuality,
      semanticLabel: semanticsLabel,
      colorBlendMode: colorBlendMode,
      gaplessPlayback: gaplessPlayback,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, _, __) {
        if (placeholderBuilder != null) return placeholderBuilder!(context);
        return child;
      },
    );
  }

  Widget _fromVectorMemory() {
    return SvgPicture.memory(
      source is Uint8List
          ? source as Uint8List
          : base64Decode(source.toString().split(',').last),
      fit: fit,
      key: key,
      theme: theme,
      color: color,
      width: size?.width,
      height: size?.height,
      alignment: alignment,
      colorFilter: colorFilter,
      clipBehavior: clipBehavior,
      semanticsLabel: semanticsLabel,
      placeholderBuilder: placeholderBuilder,
      matchTextDirection: matchTextDirection,
      excludeFromSemantics: excludeFromSemantics,
      colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
    );
  }

  /// Creates a copy of this [DImage] but with the given fields replaced with the new values.
  ///
  /// If any of the provided parameters are null, the original value from this [DImage] will be used.
  DImage<Source> copyWith({
    Source? source,
    Size? size,
    BoxFit? fit,
    Alignment? alignment,
    Color? color,
    BlendMode? colorBlendMode,
    ColorFilter? colorFilter,
    Widget Function(BuildContext)? placeholderBuilder,
    String? semanticsLabel,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  }) {
    return DImage<Source>(
      source: source ?? this.source,
      size: size ?? this.size,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      color: color ?? this.color,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      placeholderBuilder: placeholderBuilder ?? this.placeholderBuilder,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      errorBuilder: errorBuilder ?? this.errorBuilder,
    );
  }
}
