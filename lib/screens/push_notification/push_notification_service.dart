// import 'dart:io';

// import 'package:csm/screens/push_notification/navigation_service.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// import 'locator.dart';

// class PushNotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging();
//   final NavigationService _navigationService = locator<NavigationService>();

//   Future initialise() async {
//     if (Platform.isIOS) {
//       _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }

//     _fcm.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//       },
//     );
//   }
//   void _serialiseAndNavigate(Map<String, dynamic> message) {
//     var notificationData = message['data'];
//     var view = notificationData['view'];

//     if (view != null) {
//       // Navigate to the create post view
//       if (view == 'create_post') {
//         _navigationService.navigateTo(CreatePostViewRoute);
//       }
//       // If there's no view it'll just open the app on the first view
//     }
//   }
// }
