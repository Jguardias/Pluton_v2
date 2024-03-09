import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pluton_v2/services/firebase_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirebaseNotifications {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await messaging.requestPermission();
    final fCMToken = await messaging.getToken();
    print(fCMToken);
    addUsername(fCMToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print("este es un mensaje  ${message.notification}");
      }
    });
  }
}


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("title: ${message.notification?.title}");
  print("body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

Future<void> sendNotification(String title, String body) async {
  const String serverKey =
      'AAAAP2KAOYw:APA91bG5MJLho8tKvgELLBCquyzlxvqthdgstKhxV87Txv6APi0tQBVNCNWMsrsPTUGrwoySGmeumbiF03FCtX8V0kUVB69sAbps80CkZcbC9Zweyx1NypomLiYCbH33QZEsSEFW9ANR'; // Obtén tu clave de servidor desde la consola de Firebase
  const String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverKey',
  };

  final List<String> allTokens = await obtenerTodosLosTokens();

  for (String token in allTokens) {
    final Map<String, dynamic> notificationData = {
      'notification': {
        'title': title,
        'body': body,
      },
      'priority': 'high',
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        // Puedes agregar datos adicionales aquí si los necesitas
      },
      'to': token,
    };

    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: headers,
      body: jsonEncode(notificationData),
    );

    if (response.statusCode == 200) {
      print('Notificación enviada exitosamente');
    } else {
      print('Error al enviar la notificación: ${response.statusCode}');
      print(response.body);
    }
  }
}
