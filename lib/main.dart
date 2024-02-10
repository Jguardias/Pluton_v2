import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pluton_v2/providers/income_provider.dart';
import 'package:provider/provider.dart';
import 'package:pluton_v2/screens/home_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ChangeNotifierProvider(
    create: (_) => IncomeProvider(),
    child: const MyApp(),
  ));
  FlutterNativeSplash.remove();
}
