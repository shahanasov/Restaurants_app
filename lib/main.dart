import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_1/presentation/home_page.dart';
import 'package:task_1/presentation/notification_page.dart';

main() {
  runApp(
     const ProviderScope( 
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => const HomePage(), // Home screen route
        '/notifications': (context) => const NotificationPage(data: ''),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
