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

      await _fcmInstance.requestNotificationPermissions();
      
      _fcmInstance.configure(
        onMessage: (Map<String, dynamic> message) async {
          if (_onFCMReceived != null)
            _onFCMReceived(message);
        },
        onLaunch: (Map<String, dynamic> message) async {
          if (_onFCMReceived != null)
            _onFCMReceived(message);
        },
        onResume: (Map<String, dynamic> message) async {
          if (_onFCMReceived != null)
            _onFCMReceived(message);
        },
      );

      _fcmInstance.getToken().then((String token) {
        assert(token != null);
        print("new fcmToken: $token");
      });
    }
  }
}