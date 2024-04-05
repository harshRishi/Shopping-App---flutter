import 'package:flutter/material.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Lato',
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
      home: const HomePage(),
    );
  }
}
