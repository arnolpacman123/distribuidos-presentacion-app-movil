import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    print("onBackground Handler ${message.messageId}");
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    print("onMessage Handler ${message.messageId}");
  }

  static Future<void> _onMessageOpenedAppHandler(RemoteMessage message) async {
    print("onMessageOpenedApp Handler ${message.messageId}");
  }

  static Future<void> initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print("Token: $token");

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedAppHandler);
  }
}
