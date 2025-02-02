import 'package:flutter/material.dart';
import 'package:salmanalfarizzi/mobile/landing_page_mobile.dart';
import 'package:salmanalfarizzi/routes.dart';
import 'package:salmanalfarizzi/web/landing_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: "/",
      );
  }
}
