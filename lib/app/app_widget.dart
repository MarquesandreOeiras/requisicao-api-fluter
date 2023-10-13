import 'package:flutter/material.dart';
import 'package:teste_api/app/page/home_page.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de Api',
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
