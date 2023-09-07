import 'dart:developer';

import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppNotificationService {
  static hanldeNotificationClick() {
    log("Notification click--->");

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      //body contain
      final dynamic notificationData = event.notification.additionalData;
      // final custom = CustomNotification.fromJson(notificationData);

      log('NOTIFICATION WILL DISPLAY LISTENER CALLED WITH------->: ${notificationData["id"] == "1234"} ${notificationData} ${notificationData.runtimeType} ');
      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work
      if (notificationData["id"] == "1234") {
        /// notification.display() to display after preventing default
        event.notification.display();
      }
    });
  }

  static notificationPermissionCheck() async {
    final res = await OneSignal.Notifications.permissionNative();
    return res;
  }

  static requestNotificationPermission() async {
    OneSignal.Notifications.requestPermission(true);
  }
}

//Converstion

class CustomNotification {
  dynamic custom;
  CustomNotification({this.custom});

  CustomNotification.fromJson(Map<String, dynamic> json) {
    custom = json["custom"];
  }
}
