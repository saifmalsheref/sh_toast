// ignore_for_file: non_constant_identifier_names

part of 'show_toast.dart';

enum NotificationType { top, sheet }

class NotificationAnimation extends StatefulWidget {
  const NotificationAnimation(
      {Key? key,
      required this.title,
      this.content,
      this.leading,
      this.showDismiss = true,
      required this.toastOptions,
      required this.dismissButton})
      : super(key: key);
  final Widget title;
  final Widget? content;
  final Widget? leading;
  final bool showDismiss;

  final NotificationOptions toastOptions;
  final DismissButton dismissButton;

  @override
  State<NotificationAnimation> createState() => _NotificationAnimationState();
}

class _NotificationAnimationState extends State<NotificationAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration:
          widget.toastOptions.animationDuration ?? const Duration(seconds: 1),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.toastOptions.notificationType == NotificationType.top
            ? const Offset(0, -1)
            : const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: widget.toastOptions.curve ?? Curves.linearToEaseOut,
        ),
      ),
      child: Container(
        width: widget.toastOptions.width,
        height: widget.toastOptions.height,
        constraints: widget.toastOptions.constraints,
        padding: widget.toastOptions.toastPadding ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          border: widget.toastOptions.border,
          shape: widget.toastOptions.boxShape,
          color: widget.toastOptions.gradient == null
              ? (widget.toastOptions.toastColor ?? Colors.blue)
              : null,
          gradient: widget.toastOptions.gradient,
          borderRadius: BorderRadius.circular(widget.toastOptions.borderRadius),
        ),
        child: Row(
          children: [
            if (widget.leading != null) widget.leading!,
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: widget.toastOptions.crossAxisAlignment,
                mainAxisAlignment: widget.toastOptions.mainAxisAlignment,
                children: [
                  widget.title,
                  if (widget.content != null) widget.content!,
                ],
              ),
            ),
            if (widget.showDismiss) widget.dismissButton
          ],
        ),
      ),
    );
  }
}
