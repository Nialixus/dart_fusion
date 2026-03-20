part of '../dart_fusion_flutter.dart';

/// A custom text area widget.
class DTextArea extends StatelessWidget {
  /// Creates a [DTextArea].
  ///
  /// [key] is a unique identifier for the widget.
  /// [placeholder] is a widget displayed as a placeholder within the text area.
  /// [borderRadius] is the border radius of the text area.
  /// [hintText] is the text to display as a hint.
  /// [labelText] is the text to display as a label.
  /// [hintStyle] is the style for the hint text.
  /// [textStyle] is the style for the text.
  /// [backgroundColor] is the background color of the text area.
  /// [cursorColor] is the color of the cursor.
  /// [controller] is the text controller.
  /// [borderSideActive] is the border side when the text area is active.
  /// [borderSideIdle] is the border side when the text area is idle.
  /// [textAlign] is the alignment of the text.
  /// [maxLines] is the maximum number of lines.
  /// [minLines] is the minimum number of lines.
  /// [onSubmitted] is a callback function when submitted.
  /// [decoration] is the decoration for the text field.
  /// [prefixIcon] is the icon displayed before the text.
  /// [suffixIcon] is the icon displayed after the text.
  /// [contentPadding] is the padding for the content.
  /// [margin] is the margin for the text area.
  /// [footer] is the footer widget.
  const DTextArea({
    super.key,
    this.placeholder,
    this.borderRadius,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.contentPadding,
    this.backgroundColor,
    this.controller,
    this.borderSideActive,
    this.borderSideIdle,
    this.cursorColor,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.isDense = true,
    this.maxLines = 1,
    this.minLines,
    this.onSubmitted,
    this.labelStyle,
    this.labelText,
    this.margin,
    this.footer,
    this.decoration,
    this.suffixIcon,
  });

  /// Placeholder widget to be displayed within the text area when it's empty.
  final Widget? placeholder;

  /// The border radius of the text area.
  final BorderRadius? borderRadius;

  /// Hint text to be displayed when the text area is empty.
  final String? hintText;

  /// Label text to be displayed in the text area.
  final String? labelText;

  /// Padding for the content inside the text area.
  final EdgeInsets? contentPadding;

  /// Margin for the text area.
  final EdgeInsets? margin;

  /// Icon to be displayed at the beginning of the text area.
  final Widget? prefixIcon;

  /// Icon to be displayed at the end of the text area.
  final Widget? suffixIcon;

  /// Footer widget to be displayed in the text area.
  final Widget? footer;

  /// Style for the hint text.
  final TextStyle? hintStyle;

  /// Style for the text in the text area.
  final TextStyle? textStyle;

  /// Style for the label text.
  final TextStyle? labelStyle;

  /// Background color of the text area.
  final Color? backgroundColor;

  /// Color of the cursor in the text area.
  final Color? cursorColor;

  /// Controller for the text area.
  final TextEditingController? controller;

  /// Border side when the text area is active.
  final BorderSide? borderSideActive;

  /// Border side when the text area is idle.
  final BorderSide? borderSideIdle;

  /// Alignment of the text within the text area.
  final TextAlign textAlign;

  /// Maximum number of lines for the text area.
  final int? maxLines;

  /// Minimum number of lines for the text area.
  final int? minLines;

  /// Callback function when the text is submitted.
  final void Function(String)? onSubmitted;

  /// Decoration for the text field.
  final BoxDecoration? decoration;

  /// Whether the [InputDecorator.child] is part of a dense form (i.e., uses less vertical space).
  ///
  /// Defaults to true.
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return DBuilder(
        data: {
          "text_area": Container(
              margin: margin,
              decoration: decoration ??
                  BoxDecoration(
                    color: backgroundColor ??
                        context.color.surface.withValues(alpha: 0.5),
                    borderRadius: borderRadius,
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: TextField(
                        textAlign: textAlign,
                        controller: controller,
                        cursorColor: cursorColor ?? context.color.onSurface,
                        style: textStyle ??
                            context.text.bodyMedium
                                ?.copyWith(color: context.color.onSurface),
                        maxLines: maxLines,
                        minLines: minLines,
                        onSubmitted: onSubmitted,
                        decoration: InputDecoration(
                            hintText: hintText,
                            isDense: isDense,
                            labelText: labelText,
                            labelStyle: labelStyle,
                            contentPadding: contentPadding ?? EdgeInsets.zero,
                            suffixIcon: suffixIcon,
                            prefixIcon: prefixIcon,
                            hintStyle: hintStyle ??
                                context.text.bodyMedium?.copyWith(
                                    color: context.color.onSurface
                                        .withValues(alpha: 0.5),
                                    height: 0.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: borderSideActive ??
                                    BorderSide(color: context.color.onSurface),
                                borderRadius:
                                    borderRadius ?? BorderRadius.circular(4.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: borderSideIdle ??
                                    BorderSide(color: context.color.outline),
                                borderRadius: borderRadius ??
                                    BorderRadius.circular(4.0)))),
                  ),
                  if (footer != null) footer!
                ],
              ))
        },
        builder: (context, data) {
          if (placeholder != null) {
            return Stack(children: [
              Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: placeholder!),
              Positioned.fill(child: data.of<Widget>("text_area"))
            ]);
          } else {
            return data.of<Widget>("text_area");
          }
        });
  }
}
