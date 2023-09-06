import 'dart:developer';

import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppNotificationService{
  static hanldeNotificationClick(){
    log("Notification click--->");
    //Tigger the events When the user click the notification
    OneSignal.Notifications.addClickListener((event) {
      print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT--->: $event ${event.jsonRepresentation()}');
    });

  }

  //In App Notitification
  static handleInAppNotificationClick(){
    OneSignal.InAppMessages.addClickListener((event) {
   
  });
  

  }
  static notificationPermissionCheck () async{
   final res = await OneSignal.Notifications.permissionNative();
  log("res $res");
  return res;
  }
  static requestNotificationPermission () async{
     OneSignal.Notifications.requestPermission(true);
  }
}