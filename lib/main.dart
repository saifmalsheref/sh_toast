import 'package:flutter/material.dart';
import 'package:sh_toast/show_toast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShToast(
      child: MaterialApp(
        builder: FToastBuilder(),
        home: Scaffold(
            appBar: AppBar(
              title: Text('sh_toast Example'),
            ),
            body: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ShToast.showToast(
                        message: "Hello, this is a toast!",
                        toastPostion: ToastPostion.top,
                        ToastDuration:
                            Duration(milliseconds: 500), // default is 2 second
                        onTap: () {
                          print('top Toast');
                        },
                      );
                    },
                    child: Text('Show Toast'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
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
                    },
                    child: Text('Show Notification'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
