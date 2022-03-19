import 'dart:ui';

import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'database.dart';
import 'homepage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home:home(),
    debugShowCheckedModeBanner: false,
    //theme: ThemeData(brightness: Brightness.dark,
    // primaryColor: Colors.green,
    //),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
