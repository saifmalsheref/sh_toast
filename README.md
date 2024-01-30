# sh_toast

`sh_toast` is a Flutter package that provides a simple way to display toasts(short-lived notifications) without context in your app.

## Usage

To use this package, you need to include it in your `pubspec.yaml` file:

```yaml
dependencies:
  sh_toast:  # Use the latest version from pub.dev
```

Then run `flutter pub get` to install the package.

Import the package in your Dart code:

```dart
import 'package:sh_toast/sh_toast.dart';
```

Wrap your app's root widget with `FToastBuilder()`:

```dart
return MaterialApp(
  builder: FToastBuilder(),
  // ...
);
```

Now you can show a toast using `ShToast.showToast()`:

```dart
ShToast.showToast(
  message: "Hello, this is a toast!",
  toastPosition: ShToastOption.top, // Specify the position of the toast
);
```

## Available Positions

- `ShToastOption.top`
- `ShToastOption.bottom`
- `ShToastOption.topLeft`
- `ShToastOption.topRight`
- `ShToastOption.bottomRight`
- `ShToastOption.bottomLeft`

## License

This package is released under the MIT License. See [LICENSE](LICENSE) for details.
