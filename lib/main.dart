import 'package:app/Screens/MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF59FFAD),
        secondaryHeaderColor: Color(0xFF555AFF),
        accentColor: Color(0XFF030047),
        highlightColor: Color(0XFFB7B7D2),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF59FFAD)
          ),
          headline2: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF555AFF),
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF59FFAD),
          ),
          headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5F5FFF),
          ),

          bodyText1:TextStyle(
              fontSize: 20,
              color: Color(0XFFB7B7D2)
          ),
          bodyText2:TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0XFF5F5FFF)
          ),


        ),

      ),
      title: 'ROPICA',
      home:MyHomePage(),
    );
  }
}
