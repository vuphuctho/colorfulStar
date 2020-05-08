import 'package:firebase_messaging/firebase_messaging.dart';

class FCMConfiguration {
  static bool _isInit = false;
  static FirebaseMessaging _fcmInstance;
  static Function(Map<String, dynamic> message) _onFCMReceived;
  
  static void attachListener(
    Function(Map<String, dynamic> message) listener
  ) {
    assert(listener != null);
    if (_onFCMReceived == null)
      _onFCMReceived = listener;
  }

  static void init(

  ) async {
    if (!_isInit) {
      _isInit = true;
      _fcmInstance = FirebaseMessaging();

      // Omit iOS settings for now
      await _fcmInstance.requestNotificationPermissions();
      
      _fcmInstance.configure(
        onMessage: (Map<String, dynamic> message) {
          print("onMessage: $message");
          if (_onFCMReceived != null)
            _onFCMReceived(message);
        },
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
          // if (_onFCMReceived != null)
          //   _onFCMReceived(message);
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
          // if (_onFCMReceived != null)
          //   _onFCMReceived(message);
        },
      );

      _fcmInstance.getToken().then((String token) {
        assert(token != null);
        print("new fcmToken: $token");
      });
    }
  }
}