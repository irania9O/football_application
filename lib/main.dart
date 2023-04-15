import 'package:app/views/home_page.dart';
import 'package:app/views/table_leags.dart';
import 'package:flutter/material.dart';

// handle named routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // routes: {
      //   HomePage.routeName: (context) => const HomePage(),
      //   TableLeags.routeName: (context) => const TableLeags(),
      // },
    );
  }
}
