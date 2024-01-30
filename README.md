# sh_toast

`sh_toast` is a Flutter package that provides a simple way to display toasts or Notifications without context in your app.

## Usage

To use this package, you need to include it in your `pubspec.yaml` file:

```yaml
dependencies:
  sh_toast:  # Use the latest version from pub.dev
```

Then run `flutter pub get` to install the package.

Import the package in your Dart code:

```dart
import 'package:sh_toast/show_toast.dart';
```

add `FToastBuilder()` in your MaterialApp:

```dart
return MaterialApp(
  builder: FToastBuilder(),
  // ...
);
```
or Wrap your MaterialApp with ShToast widget:
 
 ```dart
 return ShToast(
      child: MaterialApp(
  // ...
        
        ));
 ```


Now you can show a toast or Notifications:

## Notifications

![Example Image](https://raw.githubusercontent.com/saifmalsheref/sh_toast/master/example_images/sheet_Notification.png)
![Example Image](https://raw.githubusercontent.com/saifmalsheref/sh_toast/master/example_images/top_Notification.png)

  parameters:
- `title`: The title widget of the notification. (Required)
- `content`: The content widget of the notification. (Optional)
- `leading`: The leading widget of the notification. (Optional)
- `showDismiss`: Flag to determine whether to display the dismiss button. (Default: true)
- `toastOptions`: The options for customizing the appearance and behavior of the notification. (Default: NotificationOptions(borderRadius: 5, secondDuration: 4))
- `dismissButton`: The custom dismiss button widget. (Default: DismissButton())
- `onTap`: Callback function to be triggered when the notification is tapped. (Optional)

```dart
ShToast.showNotification(
title: Text('Notification Title'), // reqired
content: Text('Notification Content'),
showDismiss: true, // default is True
dismissButton: DismissButton(
  onDismiss: () {
    print('dismiss');
  },
),
onTap: () {
  print('Tap notification');
},
                      );
```

## Toast

  parameters:
 - `message`: The message to be displayed in the toast. (Required)
 - `toastPostion`: The position where the toast should be shown. (Required)
 - `ToastColor`: The background color of the toast. (Default: Colors.black)
 - `msgStyle`: The text style for the message. (Optional)
 - `borderRadius`: The border radius of the toast. (Default: 10)
 - `ToastPadding`: The padding for the toast. (Default: EdgeInsets.symmetric(horizontal: 5, vertical: 3))
 - `ToastDuration`: The duration for which the toast should be visible. (Default: Duration(seconds: 2))
- `onTap`: Callback function to be triggered when the toast is tapped. (Optional)

```dart

ShToast.showToast(
  message: "Hello, this is a toast!",
  toastPosition: ToastPostion.top, // Specify the position of the toast
);
```

## Available Positions

- `ToastPostion.top`
- `ToastPostion.bottom`
- `ToastPostion.topLeft`
- `ToastPostion.topRight`
- `ToastPostion.bottomRight`
- `ToastPostion.bottomLeft`

## License

This package is released under the MIT License. See [LICENSE](LICENSE) for details.
