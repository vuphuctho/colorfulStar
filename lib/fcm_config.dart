import 'package:firebase_messaging/firebase_messaging.dart';

class FCMConfiguration {
  static bool _isInit = false;
  static FirebaseMessaging _fcmInstance;
  
  static void init() async {
    if (!_isInit) {
      _isInit = true;
      _fcmInstance = FirebaseMessaging();

      // Omit iOS settings for now
      await _fcmInstance.requestNotificationPermissions();
      
      _fcmInstance.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
        },
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
        },
      );

      _fcmInstance.getToken().then((String token) {
        assert(token != null);
        print("new fcmToken: $token");
      });
    }
  }
}