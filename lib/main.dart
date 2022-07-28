import 'package:flutter/material.dart';
import 'package:nasa_api_consumer/nasa_apod/view/nasa_apod_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NasaApodPage());
  }
}
