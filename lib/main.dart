import 'package:flutter/material.dart';
import 'helpers/database_helper.dart';

import 'login_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'homepage_screen.dart';
import 'signup_screen.dart';
import 'notification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/profile': (context) => StudentInfoCard(),
        '/signup': (context) => Register(),
        '/notification': (context) => NotiScreen(),
      },
    );
  }
}
