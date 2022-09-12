import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortener/home.dart';
import 'package:shortener/state/url.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UrlShortenerState()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Url Shortener",
      home: Home(),
    );
  }
}
