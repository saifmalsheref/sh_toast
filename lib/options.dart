part of 'show_toast.dart';

/// Enum representing different positions where the toast notification can be displayed.
enum ToastPostion {
  bottom,
  top,
  bottomRight,
  bottomLeft,
  topRight,
  topLeft,
}

/// Class representing the options for configuring the appearance and behavior of a toast notification.
class NotificationOptions {
  /// Type of the notification (e.g., success, error).
  final NotificationType notificationType;

  /// How children should be placed along the cross axis in a flex layout.
  final CrossAxisAlignment crossAxisAlignment;

  /// How the children should be placed along the main axis in a flex layout.
  final MainAxisAlignment mainAxisAlignment;

  /// Padding for the toast notification.
  final EdgeInsetsGeometry? toastPadding;

  /// Background color for the toast notification.
  final Color? toastColor;

  /// Gradient for the background of the toast notification.
  final Gradient? gradient;

  /// Duration for the animation.
  final Duration? animationDuration;

  /// Border radius for the toast notification.
  final double borderRadius;

  /// Duration for which the toast notification will be visible.
  final int secondDuration;

  /// Border for the toast notification.
  final BoxBorder? border;

  /// The shape of the toast notification box.
  final BoxShape boxShape;

  /// Curve for the animation.
  final Curve? curve;

  /// Constraints for the toast notification box.
  final BoxConstraints? constraints;

  /// Height of the toast notification box.
  final double? height;

  /// Width of the toast notification box.
  final double? width;

  const NotificationOptions({
    this.toastPadding,
    this.toastColor,
    this.gradient,
    this.animationDuration,
    this.notificationType = NotificationType.top,
    this.borderRadius = 10,
    this.secondDuration = 4,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.border,
    this.curve,
    this.boxShape = BoxShape.rectangle,
    this.constraints,
    this.height,
    this.width,
  });
}
