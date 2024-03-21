import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pluton_v2/providers/income_provider.dart';
import 'package:pluton_v2/services/firebase_notifications_services.dart';
import 'package:provider/provider.dart';
import 'package:pluton_v2/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null);

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //message cloub messange firebase
  await FirebaseNotifications().initNotification();
  //splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MultiProvider(
    //provider
    providers: [
      ChangeNotifierProvider(create: (_) => IncomeProvider()),
    ],
    //run App
    child:  const ConnectionNotifier(
      connectionNotificationOptions: ConnectionNotificationOptions(
        disconnectedText: "Sin conexión a internet",
        connectedText: "Conexión a internet restablecida"
      ),
      child: MyApp()),
  ));
  FlutterNativeSplash.remove();
}
