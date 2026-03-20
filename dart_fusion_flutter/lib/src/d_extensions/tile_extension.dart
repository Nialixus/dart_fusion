part of '../../dart_fusion_flutter.dart';

/// Extension on [ExpansionTile] providing a convenient method to create a copy
/// of the tile with modified properties.
///
/// Example usage:
/// ```dart
/// ExpansionTile originalTile = // your original tile;
/// ExpansionTile modifiedTile = originalTile.copyWith(
///   // modify properties here
/// );
/// ```
extension TileExtension on ExpansionTile {
  /// Creates a copy of the [ExpansionTile] with modified properties.
  ///
  /// Parameters allow you to override specific properties of the original tile.
  /// If a parameter is not provided, the corresponding property from the
  /// original tile will be used.
  ExpansionTile copyWith({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    void Function(bool)? onExpansionChanged,
    List<Widget>? children,
    Widget? trailing,
    bool? initiallyExpanded,
    bool? maintainState,
    EdgeInsetsGeometry? tilePadding,
    CrossAxisAlignment? expandedCrossAxisAlignment,
    Alignment? expandedAlignment,
    EdgeInsetsGeometry? childrenPadding,
    Color? backgroundColor,
    Color? collapsedBackgroundColor,
    Color? textColor,
    Color? collapsedTextColor,
    Color? iconColor,
    Color? collapsedIconColor,
    ShapeBorder? shape,
    ShapeBorder? collapsedShape,
    Clip? clipBehavior,
    ListTileControlAffinity? controlAffinity,
    ExpansibleController? controller,
  }) {
    return ExpansionTile(
      key: key ?? this.key,
      leading: leading ?? this.leading,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      onExpansionChanged: onExpansionChanged ?? this.onExpansionChanged,
      trailing: trailing ?? this.trailing,
      initiallyExpanded: initiallyExpanded ?? this.initiallyExpanded,
      maintainState: maintainState ?? this.maintainState,
      tilePadding: tilePadding ?? this.tilePadding,
      expandedCrossAxisAlignment:
          expandedCrossAxisAlignment ?? this.expandedCrossAxisAlignment,
      expandedAlignment: expandedAlignment ?? this.expandedAlignment,
      childrenPadding: childrenPadding ?? this.childrenPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      collapsedBackgroundColor:
          collapsedBackgroundColor ?? this.collapsedBackgroundColor,
      textColor: textColor ?? this.textColor,
      collapsedTextColor: collapsedTextColor ?? this.collapsedTextColor,
      iconColor: iconColor ?? this.iconColor,
      collapsedIconColor: collapsedIconColor ?? this.collapsedIconColor,
      shape: shape ?? this.shape,
      collapsedShape: collapsedShape ?? this.collapsedShape,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      controller: controller ?? this.controller,
      children: children ?? this.children,
    );
  }
}
