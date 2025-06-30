import 'package:book_my_console/pages/home_screen4.dart';
import 'package:book_my_console/pages/incrementer.dart';
import 'package:book_my_console/pages/locationPage.dart';
import 'package:book_my_console/pages/login.dart';
import 'package:book_my_console/pages/startPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const startPage(),
        '/login': (context) => const LoginPage(),
        '/location': (context) => const SelectLocationScreen(),
        '/incrementer': (context) => const CounterPage(),
        '/homePage': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class LocationPage {
  const LocationPage();
}
