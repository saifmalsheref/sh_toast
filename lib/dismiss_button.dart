part of 'show_toast.dart';

class DismissButton extends StatelessWidget {
  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? splashRadius;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final void Function()? onDismiss;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool? enableFeedback;
  final BoxConstraints? constraints;
  final ButtonStyle? style;
  final bool? isSelected;
  final Widget? selectedIcon;
  final Widget? icon;
  void hideToast() {
    if (ShToast.isToastVisible && ShToast._overlayEntry != null) {
      ShToast._overlayEntry!.remove();
      ShToast.isToastVisible = false;
    }
  }

  const DismissButton(
      {Key? key,
      this.icon,
      this.alignment,
      this.autofocus = false,
      this.color,
      this.constraints,
      this.disabledColor,
      this.enableFeedback,
      this.focusColor,
      this.focusNode,
      this.highlightColor,
      this.hoverColor,
      this.iconSize,
      this.isSelected,
      this.mouseCursor,
      this.onDismiss,
      this.padding,
      this.selectedIcon,
      this.splashColor,
      this.splashRadius,
      this.style,
      this.tooltip,
      this.visualDensity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        alignment: alignment,
        autofocus: autofocus,
        color: color,
        constraints: constraints,
        disabledColor: disabledColor,
        enableFeedback: enableFeedback,
        focusColor: focusColor,
        focusNode: focusNode,
        highlightColor: highlightColor,
        hoverColor: hoverColor,
        iconSize: iconSize,
        isSelected: isSelected,
        mouseCursor: mouseCursor,
        padding: padding,
        selectedIcon: selectedIcon,
        splashColor: splashColor,
        splashRadius: splashRadius,
        style: style,
        tooltip: tooltip,
        visualDensity: visualDensity,
        onPressed: () {
          hideToast();
          if (onDismiss != null) {
            onDismiss!();
          }
        },
        key: key,
        icon: icon ?? const Icon(Icons.close));
  }
}
