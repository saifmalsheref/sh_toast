// ignore_for_file: non_constant_identifier_names
library sh_toast;

import 'package:flutter/material.dart';

part 'options.dart';
part 'notification_animation.dart';
part 'dismiss_button.dart';

GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();

TransitionBuilder FToastBuilder() {
  return (context, child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        key: overlayKey,
        initialEntries: [
          OverlayEntry(
            builder: (context) => child!,
          ),
        ],
      ),
    );
  };
}

class ShToast extends StatelessWidget {
  static OverlayEntry? _overlayEntry;
  static bool isToastVisible = false;

  static void showNotification({
    required Widget title,
    Widget? content,
    Widget? leading,
    bool showDismiss = true,
    NotificationOptions toastOptions = const NotificationOptions(
      borderRadius: 5,
      secondDuration: 4,
    ),
    dismissButton = const DismissButton(),
    Function()? onTap,
  }) {
    if (isToastVisible && _overlayEntry != null) {
      _overlayEntry!.remove();
      isToastVisible = false;
    }

    _overlayEntry = OverlayEntry(builder: (BuildContext context) {
      double height = MediaQuery.of(context).size.height;

      return Positioned(
        top: toastOptions.notificationType == NotificationType.top
            ? height / 20
            : null,
        bottom: toastOptions.notificationType == NotificationType.sheet
            ? height / 20
            : null,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: onTap,
            child: NotificationAnimation(
              toastOptions: toastOptions,
              dismissButton: dismissButton,
              title: title,
              content: content,
              leading: leading,
              showDismiss: showDismiss,
            ),
          ),
        ),
      );
    });

    overlayKey.currentState!.insert(_overlayEntry!);

    isToastVisible = true;

    Future.delayed(Duration(seconds: toastOptions.secondDuration), () {
      if (isToastVisible && _overlayEntry != null) {
        _overlayEntry!.remove();
        isToastVisible = false;
      }
    });
  }

  static void showToast({
    ///[message] : The message to be displayed in the toast. (Required)
    required String message,

    ///[toastPostion]: The position where the toast should be shown. (Required)
    required ToastPostion toastPostion,

    ///[ToastColor] : The background color of the toast. (Default: Colors.black)
    Color ToastColor = Colors.black,

    ///[msgStyle] : The text style for the message. (Optional)
    TextStyle? msgStyle,

    ///[borderRadius] : The border radius of the toast. (Default: 10)
    double borderRadius = 10,

    ///[padding] : The padding for the toast. (Default: EdgeInsets.symmetric(horizontal: 5, vertical: 3))
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),

    ///[ToastDuration] The duration for which the toast should be visible. (Default: Duration(seconds: 2))
    Duration ToastDuration = const Duration(seconds: 2),

    ///[onTap] : Callback function to be triggered when the toast is tapped. (Optional)
    Function()? onTap,
  }) {
    if (isToastVisible && _overlayEntry != null) {
      _overlayEntry!.remove();
      isToastVisible = false;
    }

    _overlayEntry = OverlayEntry(builder: (BuildContext context) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      double? right;
      double? left;
      double? top;
      double? bottom;
      switch (toastPostion) {
        case ToastPostion.top:
          top = height / 20;
          left = width / 2;
          break;
        case ToastPostion.bottom:
          bottom = height / 20;
          left = width / 2;
          break;
        case ToastPostion.topLeft:
          left = 10;
          top = height * 0.1;
          break;
        case ToastPostion.topRight:
          right = 10;
          top = height * 0.1;
          break;
        case ToastPostion.bottomRight:
          right = 10;
          bottom = height * 0.1;
          break;
        case ToastPostion.bottomLeft:
          left = 10;
          bottom = height * 0.1;
          break;
        default:
          break;
      }
      return Positioned(
        bottom: bottom,
        top: top,
        left: left,
        right: right,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: ToastColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: msgStyle ?? const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });

    overlayKey.currentState!.insert(_overlayEntry!);

    isToastVisible = true;

    Future.delayed(ToastDuration, () {
      if (isToastVisible && _overlayEntry != null) {
        _overlayEntry!.remove();
        isToastVisible = false;
      }
    });
  }

  final Widget child;
  const ShToast({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        key: overlayKey,
        initialEntries: [
          OverlayEntry(
            builder: (context) => child,
          ),
        ],
      ),
    );
  }
}
