
import 'package:firebase_messaging/firebase_messaging.dart';

class Payment {
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted Provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void getToken() async {
  final fcmToken = await FirebaseMessaging.instance.getToken();

  }

}
